-- "pml-writer.lua" v0.0.5 | 2022/02/28            | PML 2.3.0 | pandoc 2.17.1.1
-- =============================================================================
-- ** WARNING ** This PML writer is being built on top of the sample writer that
--               ships with pandoc; generated via:
--
--    pandoc --print-default-data-file sample.lua > pml-writer.lua
--
-- This source integrates the changes of the sample writer from pandoc 2.17.1.1
-- (i.e. from time to time it's diffed with the latest sample to see if there
-- are new updated worth integrating).
--
-- Since it emulates pandoc's HTML writer it will be used as a starting point
-- to build our PML writer on top of with. PML is structurally similar to HTML,
-- so most AST nodes can easily be adapted by changing the generated HTML tags
-- to PML nodes. In any case, bear in mind that most functions are still left
-- untouched, as they were in the original codebase.
--
-- Invoke with: pandoc -t pml-writer.lua
-- =============================================================================
-- This is a sample custom writer for pandoc.  It produces output
-- that is very similar to that of pandoc's HTML writer.
-- There is one new feature: code blocks marked with class 'dot'
-- are piped through graphviz and images are included in the HTML
-- output using 'data:' URLs. The image format can be controlled
-- via the `image_format` metadata field.
--
-- Invoke with: pandoc -t sample.lua
--
-- Note:  you need not have lua installed on your system to use this
-- custom writer.  However, if you do have lua installed, you can
-- use it to test changes to the script.  'lua sample.lua' will
-- produce informative error messages if your code contains
-- syntax errors.

local pipe = pandoc.pipe
local stringify = (require 'pandoc.utils').stringify

-- The global variable PANDOC_DOCUMENT contains the full AST of
-- the document which is going to be written. It can be used to
-- configure the writer.
local meta = PANDOC_DOCUMENT.meta

-- Choose the image format based on the value of the
-- `image_format` meta value.
local image_format = meta.image_format
  and stringify(meta.image_format)
  or 'png'
local image_mime_type = ({
    jpeg = 'image/jpeg',
    jpg = 'image/jpeg',
    gif = 'image/gif',
    png = 'image/png',
    svg = 'image/svg+xml',
  })[image_format]
  or error('unsupported image format `' .. image_format .. '`')

-- Character escaping
-- @TODO: Adapt to PML escaping rules (WIP)
local function escape(s, in_attribute)
  return s:gsub('[\\%[%]"]',
    function(x)
      if x == '\\' then
        return '\\\\'
      elseif x == '[' then
        return '\\['
      elseif x == ']' then
        return '\\]'
      elseif in_attribute and x == '"' then
        return '\\"'
      else
        return x
      end
    end)
end

-- Helper function to convert an attributes table into
-- a string that can be put into HTML tags.
local function attributes(attr)
  local attr_table = {}
  for x,y in pairs(attr) do
    if y and y ~= '' then
      table.insert(attr_table, ' ' .. x .. '="' .. escape(y,true) .. '"')
    end
  end
  return table.concat(attr_table)
end

-- Table to store footnotes, so they can be included at the end.
local notes = {}

-- Blocksep is used to separate block elements.
function Blocksep()
  return '\n\n'
end

-- This function is called once for the whole document. Parameters:
-- body is a string, metadata is a table, variables is a table.
-- This gives you a fragment.  You could use the metadata table to
-- fill variables in a custom lua template.  Or, pass `--template=...`
-- to pandoc, and pandoc will do the template processing as usual.
function Doc(body, metadata, variables)
  local buffer = {}
  local function add(s)
    table.insert(buffer, s)
  end
  add(body)
  -- @TBD: Inject Footnotes
--[[
  if #notes > 0 then
    add('<ol class="footnotes">')
    for _,note in pairs(notes) do
      add(note)
    end
    add('</ol>')
  end
--]]

  -- Close [ch Nodes
  -- ---------------
  -- add("@ openChNodes: " .. tostring(openChNodes))
  if openChNodes then
    add('\n')
    for i=1,openChNodes do
      add(']')
    end
  end
  return table.concat(buffer,'\n') .. '\n'
end

-- PANDOC ELEMENTS
-- ===============
-- The functions that follow render corresponding pandoc elements.
-- s is always a string, attr is always a table of attributes, and
-- items is always an array of strings (the items in a list).
-- Comments indicate the types of other variables.

function Str(s)
  return escape(s)
end

function Space()
  return ' '
end

function SoftBreak()
  return '\n'
end

function LineBreak()
  return '<br/>'
end

function Emph(s)
  return '[i ' .. s .. ']'
end

function Strong(s)
  return '[b ' .. s .. ']'
end

function Underline(s)
  return '[span (html_style="text-decoration: underline;") ' .. s .. ']'
end

function Subscript(s)
  return '[sub ' .. s .. ']'
end

function Superscript(s)
  return '[sup ' .. s .. ']'
end

function SmallCaps(s)
  return '[span (html_style="font-variant: small-caps;") ' .. s .. ']'
end

function Strikeout(s)
  return '[strike ' .. s .. ']'
end

function Link(s, tgt, tit, attr)
  -- @TODO: Handle title + attributes
  return '[link url=' .. escape(tgt,true) .. ' text="' .. s .. '"]'
--[[
  return '<a href="' .. escape(tgt,true) .. '" title="' ..
         escape(tit,true) .. '"' .. attributes(attr) .. '>' .. s .. '</a>'
--]]
end

function Image(s, src, tit, attr)
  -- @FIXME: If src is a web URL, emit Raw HTML instead!
  local outstr
  outstr = '[image source="' .. escape(src,true) .. '"'
  if #tit ~= 0 then
    outstr = outstr .. ' html_title="' .. escape(tit,true) .. '"'
  end
  return outstr .. ']'
--[[
  return '<img src="' .. escape(src,true) .. '" title="' ..
         escape(tit,true) .. '"/>'
--]]
end

function Code(s, attr)
  -- @TODO: Handle inline-code attributes!
  return '[c ' .. escape(s) .. ']'
--[[
  return "<code" .. attributes(attr) .. ">" .. escape(s) .. "</code>"
--]]
end

function InlineMath(s)
  return '\\(' .. escape(s) .. '\\)'
end

function DisplayMath(s)
  return '\\[' .. escape(s) .. '\\]'
end

function SingleQuoted(s)
  return '&lsquo;' .. s .. '&rsquo;'
end

function DoubleQuoted(s)
  return '&ldquo;' .. s .. '&rdquo;'
end

function Note(s)
  local num = #notes + 1
  -- insert the back reference right before the final closing tag.
  s = string.gsub(s,
          '(.*)</', '%1 <a href="#fnref' .. num ..  '">&#8617;</a></')
  -- add a list item with the note to the note table.
  table.insert(notes, '<li id="fn' .. num .. '">' .. s .. '</li>')
  -- return the footnote reference, linked to the note.
  return '<a id="fnref' .. num .. '" href="#fn' .. num ..
            '"><sup>' .. num .. '</sup></a>'
end

function Span(s, attr)
  return '<span' .. attributes(attr) .. '>' .. s .. '</span>'
end

function RawInline(format, str)
  if format == 'html' then
    return str
  else
    return ''
  end
end

function Cite(s, cs)
  local ids = {}
  for _,cit in ipairs(cs) do
    table.insert(ids, cit.citationId)
  end
  return '<span class="cite" data-citation-ids="' .. table.concat(ids, ',') ..
    '">' .. s .. '</span>'
end

function Plain(s)
  return s
end

function Para(s)
  return s
--[[
  return '<p>' .. s .. '</p>'
--]]
end

currChLev = 0
openChNodes = 0

-- lev is an integer, the header level.
function Header(lev, s, attr)
  local closeNodes = ''
  if currChLev < lev then
    for i=0,lev-currChLev do
      openChNodes = openChNodes +1
    end
    openChNodes = openChNodes -1
  elseif currChLev > lev then
    for i=0,currChLev-lev do
      closeNodes = closeNodes .. ']'
      openChNodes = openChNodes -1
    end
    openChNodes = openChNodes +1
  else
    closeNodes = closeNodes .. ']'
  end

  currChLev = lev
  return closeNodes .. '[ch [title ' .. s .. ']'
end

function BlockQuote(s)
  return '[quote\n' .. s .. '\n]'
end

function HorizontalRule()
  return '[html\n<hr/>\nhtml]'
end

function LineBlock(ls)
  return '<div style="white-space: pre-line;">' .. table.concat(ls, '\n') ..
         '</div>'
end

function CodeBlock(s, attr)
  -- If code block has class 'dot', pipe the contents through dot
  -- and base64, and include the base64-encoded png as a data: URL.
  if attr.class and string.match(' ' .. attr.class .. ' ',' dot ') then
    local img = pipe('base64', {}, pipe('dot', {'-T' .. image_format}, s))
    return '<img src="data:' .. image_mime_type .. ';base64,' .. img .. '"/>'
  -- otherwise treat as code (one could pipe through a highlighter)
  else
--[[
    return '<pre><code' .. attributes(attr) .. '>' .. escape(s) ..
           '</code></pre>'
--]]
    return '[code' .. attributes(attr) .. '\n' .. s .. '\ncode]\n'
  end
end

function BulletList(items)
  local buffer = {}
  for _, item in pairs(items) do
    table.insert(buffer, "[el " .. item .. "]")
  end
  return "[list\n" .. table.concat(buffer, "\n") .. "\n]"
end

function OrderedList(items)
  local buffer = {}
  for _, item in pairs(items) do
    table.insert(buffer, "[el " .. item .. "]")
  end
  return '[list (html_style="list-style-type:decimal")\n' .. table.concat(buffer, "\n") .. "\n]"
end

function DefinitionList(items)
  local buffer = {}
  for _,item in pairs(items) do
    local k, v = next(item)
    table.insert(buffer, '<dt>' .. k .. '</dt>\n<dd>' ..
                   table.concat(v, '</dd>\n<dd>') .. '</dd>')
  end
  return '<dl>\n' .. table.concat(buffer, '\n') .. '\n</dl>'
end

-- Convert pandoc alignment to something HTML can use.
-- align is AlignLeft, AlignRight, AlignCenter, or AlignDefault.
local function html_align(align)
  if align == 'AlignLeft' then
    return 'left'
  elseif align == 'AlignRight' then
    return 'right'
  elseif align == 'AlignCenter' then
    return 'center'
  else
    return 'left'
  end
end

function CaptionedImage(src, tit, caption, attr)
  -- @FIXME: If src is a web URL, emit Raw HTML instead!
  if attr.id then
    local img_id = " id=" .. attr.id
  end
  if #caption == 0 then
    return  '[image source="' .. escape(src,true) ..
            '"' .. attr.id .. ']'
--[[
    return '<p><img src="' .. escape(src,true) .. '"' .. attr.id ..
      '"/></p>'
--]]
  else
    local ecaption = escape(caption)
    return '[image source="' .. escape(src,true) .. '"' ..
           attr.id ..
           ' caption="' .. ecaption ..
           '" html_alt="' .. ecaption .. '"]'
--[[
    return '<figure>\n<img src="' .. escape(src,true) ..
        '" id="' .. attr.id .. '" alt="' .. ecaption  .. '"/>' ..
        '<figcaption>' .. ecaption .. '</figcaption>\n</figure>'
--]]
  end
end

-- Caption is a string, aligns is an array of strings,
-- widths is an array of floats, headers is an array of
-- strings, rows is an array of arrays of strings.
function Table(caption, aligns, widths, headers, rows)
  local buffer = {}
  local function add(s)
    table.insert(buffer, s)
  end
  add('<table>')
  if caption ~= '' then
    add('<caption>' .. escape(caption) .. '</caption>')
  end
  if widths and widths[1] ~= 0 then
    for _, w in pairs(widths) do
      add('<col width="' .. string.format('%.0f%%', w * 100) .. '" />')
    end
  end
  local header_row = {}
  local empty_header = true
  for i, h in pairs(headers) do
    local align = html_align(aligns[i])
    table.insert(header_row,'<th align="' .. align .. '">' .. h .. '</th>')
    empty_header = empty_header and h == ''
  end
  if not empty_header then
    add('<tr class="header">')
    for _,h in pairs(header_row) do
      add(h)
    end
    add('</tr>')
  end
  local class = 'even'
  for _, row in pairs(rows) do
    class = (class == 'even' and 'odd') or 'even'
    add('<tr class="' .. class .. '">')
    for i,c in pairs(row) do
      add('<td align="' .. html_align(aligns[i]) .. '">' .. c .. '</td>')
    end
    add('</tr>')
  end
  add('</table>')
  return table.concat(buffer,'\n')
end

function RawBlock(format, str)
  if format == 'html' then
    -- @TODO: Intercept HTML comments and convert them to PML comments!
    return '[html\n' .. str .. '\nhtml]'
--[[
    return str
--]]
  else
    return ''
  end
end

function Div(s, attr)
  return '<div' .. attributes(attr) .. '>\n' .. s .. '</div>'
end

-- RUNTIME WARNINGS
-- ================
-- The following code will produce runtime warnings when you haven't defined
-- all of the functions you need for the custom writer, so it's useful
-- to include when you're working on a writer.
local meta = {}
meta.__index =
  function(_, key)
    io.stderr:write(string.format("WARNING: Undefined function '%s'\n",key))
    return function() return '' end
  end
setmetatable(_G, meta)
