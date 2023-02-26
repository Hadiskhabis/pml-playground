# Pandoc Lua Filters

Exploring the use of [pandoc Lua filters] for converting from PML to pandoc (via HTML as an intermediate format) and to create a [custom writer] for the PML syntax.

- [`pml-writer/`][pml-writer/] — pandoc to PML converter (WIP).

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [About](#about)
- [Development Tools](#development-tools)
- [Reference Links](#reference-links)

<!-- /MarkdownTOC -->

-----

# About

Pandoc is a well known command line tool for converting to and from a huge variety of formats, with special emphasis on [lightweight markup languages].

The creation of custom [pandoc Lua filters] to convert from PML to pandoc, and vice versa, would open the doors to PML interoperability with all the documentation formats supported by pandoc.

For a full discussion of the topic, see [pml-lang/converter#26].


# Development Tools

Lua filters developers are advised to download the [ZeroBrane] Lua IDE, which natively ships with Lua and all the required debugging modules:

> ## [Debugging Lua filters]
>
> It is possible to use a debugging interface to halt execution and step through a Lua filter line by line as it is run inside Pandoc.
> This is accomplished using the remote-debugging interface of the package [mobdebug].
> Although [mobdebug] can be run from the terminal, it is more useful run within the donation-ware Lua editor and IDE, [ZeroBrane].
> ZeroBrane offers a REPL console and UI to step-through and view all variables and state.
>
> If you already have Lua 5.4 installed, you can add [mobdebug] and its dependency [luasocket] using [luarocks], which should then be available on the path.
> ZeroBrane also includes both of these in its package, so if you don't want to install Lua separately, you should add/modify your `LUA_PATH` and `LUA_CPATH` to include the correct locations; see [detailed instructions here][ZeroBrane remote-debugging].

For detailed instructions on setting up [ZeroBrane Studio] for debugging [pandoc Lua filters], and a sample Lua filter with debugging features, see:

- [pandoc/lua-filters] » [lua-debug-example]

[ZeroBrane Studio] is available as both portable and installer version.
Windows users can also install ZeroBrane Studio via [Chocolatey] or [Chocolatey GUI], to simplify updating the application:

- [Chocolatey » ZeroBrane Studio (Portable)]
- [Chocolatey » ZeroBrane Studio (Install)]


-------------------------------------------------------------------------------

# Reference Links

<!-- MarkdownTOC:excluded -->
## Pandoc

- [pandoc.org] — pandoc website:
    + [Pandoc User's Guide]\:
        * [Custom readers and writers]
    + [Pandoc Filters]
    + [Pandoc Lua Filters]\:
        * [Debugging Lua filters]
        * [Lua type reference]\:
            - [Meta][Lua_t Meta]
            - [Block][Lua_t Block]
            - [Inline][Lua_t Inline]
    + [Creating Custom Pandoc Writers in Lua]
        * [Changes in pandoc 3.0]
- [jgm/pandoc] — official pandoc repository.
    + [`test/`][pandoc/test/] — test folder with examples.
- [github.com/pandoc] — pandoc org on GitHub:
    + [pandoc/ast-migrator] — Migrate documents from one pandoc AST schema to another.
    + [pandoc/lua-filters] — A collection of Lua filters for pandoc:
        * [lua-debug-example] — Example of [debugging Lua filters] with the [ZeroBrane Studio] IDE.
- [Pandoc AST format] — in [pandoc-types] package (Haskell).


<!-- MarkdownTOC:excluded -->
## Lua

Pandoc v3.x includes a Lua 5.4 interpreter and library built into the pandoc executable.

- [www.lua.org] — Lua website:
    + [Lua 5.4 Reference Manual]
        * [§6.4 – String Manipulation]
            - [string.gsub]
        * [§6.4.1 – Patterns]
- [LuaBinaries] — Pre-compiled Lua libraries and executables.
- [ZeroBrane Studio] — Lightweight Lua IDE with native support for [debugging Lua filters] via the [MobDebug] package:
    + [Remote Debugging][ZeroBrane remote-debugging]
    + [Lua 5.4 Debugging][ZeroBrane Lua 5.4 Debugging]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[lightweight markup languages]: https://en.wikipedia.org/wiki/Lightweight_markup_language "Wikipedia » Lightweight markup language"

<!-- pandoc -->

[pandoc]: https://pandoc.org "Visit pandoc website"
[pandoc.org]: https://pandoc.org "Visit pandoc website"

[Pandoc User's Guide]: https://pandoc.org/MANUAL.html "Pandoc User's Guide"
[Custom readers and writers]: https://pandoc.org/MANUAL.html#custom-readers-and-writers "Pandoc User's Guide » Custom readers and writers"

[Creating Custom Pandoc Writers in Lua]: https://pandoc.org/custom-writers.html "Pandoc documentation on Lua Writers"
[Changes in pandoc 3.0]: https://pandoc.org/custom-writers.html "Changes in Lua writers between pandoc 2 and 3"

[Pandoc filters]: https://pandoc.org/filters.html

[Pandoc Lua Filters]: https://pandoc.org/lua-filters.html "Pandoc documentation on Lua Filters"
[Debugging Lua filters]: https://pandoc.org/lua-filters.html#debugging-lua-filters
[Lua type reference]: https://pandoc.org/lua-filters.html#lua-type-reference "Pandoc » Lua Filters » Lua Types"
[Lua_t Meta]: https://pandoc.org/lua-filters.html#type-meta "Pandoc » Lua Filters » Lua Types » Meta"
[Lua_t Block]: https://pandoc.org/lua-filters.html#type-block "Pandoc » Lua Filters » Lua Types » Block"
[Lua_t Inline]: https://pandoc.org/lua-filters.html#type-inline "Pandoc » Lua Filters » Lua Types » Inline"

<!-- pandoc Haskell -->

[pandoc-types]: https://hackage.haskell.org/package/pandoc-types/ "The 'pandoc-types' package at Hackage"
[Pandoc AST format]: https://hackage.haskell.org/package/pandoc-types/docs/Text-Pandoc-Definition.html "View AST definition at 'pandoc-types' package"

<!-- pandoc GitHub -->

[github.com/pandoc]: https://github.com/pandoc
[jgm/pandoc]: https://github.com/jgm/pandoc
[pandoc/test/]: https://github.com/jgm/pandoc/tree/master/test

[pandoc/lua-filters]: https://github.com/pandoc/lua-filters "A collection of Lua filters for pandoc"
[lua-debug-example]: https://github.com/pandoc/lua-filters/tree/master/lua-debug-example

[pandoc/ast-migrator]: https://github.com/pandoc/ast-migrator

<!-- Lua -->

[Lua]: https://www.lua.org "Lua website"
[www.lua.org]: https://www.lua.org "Lua website"

[Lua 5.4 Reference Manual]: https://www.lua.org/manual/5.4/
[§6.4 – String Manipulation]: https://www.lua.org/manual/5.4/manual.html#6.4
[string.gsub]: https://www.lua.org/manual/5.4/manual.html#pdf-string.gsub
[§6.4.1 – Patterns]: https://www.lua.org/manual/5.4/manual.html#6.4.1

[ZeroBrane]: https://studio.zerobrane.com "ZeroBrane Studio website"
[ZeroBrane Studio]: https://studio.zerobrane.com "ZeroBrane Studio website"
[ZeroBrane remote-debugging]: https://studio.zerobrane.com/doc-remote-debugging "ZeroBrane documentation on Remote Debugging"
[ZeroBrane Lua 5.4 Debugging]: https://studio.zerobrane.com/doc-lua54-debugging "ZeroBrane documentation on Lua 5.4 Debugging"

[MobDebug]: https://github.com/pkulchenko/MobDebug
[LuaSocket]: https://luarocks.org/modules/luasocket/luasocket
[LuaRocks]: https://luarocks.org "LuaRocks: the package manager for Lua modules."

[LuaBinaries]: http://luabinaries.sourceforge.net/

<!-- Chocolatey -->

[Chocolatey]: https://chocolatey.org "Chocolatey package manager for Windows"
[Chocolatey GUI]: https://community.chocolatey.org/packages/ChocolateyGUI "Chocolatey GUI package page"
[Chocolatey » ZeroBrane Studio (Portable)]: https://community.chocolatey.org/packages/zerobrane-studio.portable "ZeroBrane Studio Chocolatey package (portable version)"
[Chocolatey » ZeroBrane Studio (Install)]: https://community.chocolatey.org/packages/zerobrane-studio.install "ZeroBrane Studio Chocolatey package (installer version)"

<!-- Issues/Discussions -->

[pml-lang/converter#26]: https://github.com/pml-lang/converter/discussions/26 "See Discussion #26 at pml-lang — Pandoc to PML Coverter Filter"

<!-- project files & folders -->

[pml-writer/]: ./pml-writer/ "Navigate to folder: pandoc PML writer"

<!-- EOF -->
