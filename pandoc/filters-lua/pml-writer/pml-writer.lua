-- "pml-writer.lua" v0.0.8 | 2022/11/02            | PML 3.1.0 | pandoc 2.19.2
-- =============================================================================
-- ** WARNING ** This PML writer is being built on top of the sample writer that
--               ships with pandoc; generated via:
--
--    pandoc --print-default-data-file sample.lua > pml-writer.lua
--
-- This source integrates the changes of the sample writer from pandoc 2.19.2
-- (i.e. from time to time it's diffed with the latest sample to see if there
-- are new code changes worth integrating).
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

-- Emit Caption Node
local function caption_node(s)
  return '[caption ' .. escape(s) .. ']'
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
  if #tgt == 0 then
    -- Render empty link as normal text
    return escape(s)
  end
  -- @TODO: Add a dedicated URL escape function:
  return '[link url=' .. tgt .. ' text="' .. escape(s) .. '"]'
--[[
  return '<a href="' .. escape(tgt,true) .. '" title="' ..
         escape(tit,true) .. '"' .. attributes(attr) .. '>' .. s .. '</a>'
--]]
end

function Image(s, src, tit, attr)
  local outstr
  outstr = '[image source="' .. escape(src,true) .. '"'
  if #tit ~= 0 then
    outstr = outstr .. ' html_alt="' .. escape(tit,true) .. '"'
  end
  return outstr .. ']'
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

-- Look-up Table for pandoc to HTML numeric styles names
num_styles_lut = {
-- @TODO: complete list: https://www.w3schools.com/CSSref/pr_list-style-type.asp
  LowerRoman = "lower-roman",
  UpperRoman = "upper-roman",
  LowerAlpha = "lower-alpha",
  UpperAlpha = "upper-alpha",
  -- DefaultStyle ???
  -- Example ???
  -- Decimal -> already covered by our fallback value
}

function OrderedList(items, start, style)
  -- @TODO: Extract info about:
  --   [x] Numerals list-style-type.
  --   [ ] Start number (WIP: commented out due to PMLC bug #91).
  --   [ ] Optimize code: The above LUT should be kept inside the func
  --       block, to keep the code clean, but *without* the performance
  --       hit of heap-allocating the table at each function call! See:
  --          http://lua-users.org/wiki/SwitchStatement
  local buffer = {}
  for _, item in pairs(items) do
    table.insert(buffer, "[el " .. item .. "]")
  end
  html_style = num_styles_lut[style] or "decimal"
  if start ~= 1
    then start_str = ' html_start=' .. start
    else start_str = ''
  end
  -- A bug in PML 3.1.0 causes 'html_start' to crash, so we temporarily
  -- need to suppress the attribute until fixed. See: pml-lang/pml-companion#91
  start_str = '' -- @DELME!
  return '[list (html_style="list-style-type:'.. html_style ..'"' ..
          start_str .. ")\n" .. table.concat(buffer, "\n") .. "\n]"
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
  if attr.id then
    local img_id = " id=" .. attr.id
  end
  if #caption == 0 then
    return '[image source="' .. escape(src,true) .. '"' ..
            attr.id .. ']'
  else
    return '[image source="' .. escape(src,true) .. '"' ..
            attr.id ..
            ' html_alt="' .. escape(caption) .. '"]' ..
            caption_node(caption)
  end
end

-- Caption is a string, aligns is an array of strings,
-- widths is an array of floats, headers is an array of
-- strings, rows is an array of arrays of strings.
function Table(caption, aligns, widths, headers, rows)
  -- @NOTE: Column widths info is discarded. See original "sample.lua"
  --        on how it was preserved in HTML. For PML, it requires
  --        adaptation to `[table halign=""` list of comma separated
  --        values.
  local buffer = {}
  local function add(s)
    table.insert(buffer, s)
  end
  add('[table')
  local header_row = {}
  local empty_header = true
  for _, h in pairs(headers) do
    table.insert(header_row,'[tc ' .. h .. ']\n')
    empty_header = empty_header and h == ''
  end
  if not empty_header then
    add('[theader [tr')
    for _,h in pairs(header_row) do
      add(h)
    end
    add(']]')
  end
  for _, row in pairs(rows) do
    add('[tr')
    for i,c in pairs(row) do
      add('[tc '.. c .. ']')
    end
    add(']')
  end
  add(']')
  if caption ~= '' then
    add(caption_node(caption))
  end
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
