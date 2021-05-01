# Pandoc Lua Filters

Exploring the use of [pandoc Lua filters] for converting from PML to pandoc (via HTML as an intermediate format) and to create a [custom writer] for the PML syntax.

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
> If you already have Lua 5.3 installed, you can add [mobdebug] and its dependency [luasocket] using [luarocks], which should then be available on the path.
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
    + [Pandoc User's Guide]:
        * [Custom writers]
    + [Pandoc Filters]
    + [Pandoc Lua Filters]:
        * [Debugging Lua filters]
        * [Lua type reference]
- [jgm/pandoc] — official pandoc repository.
- [github.com/pandoc] — pandoc org on GitHub:
    + [pandoc/ast-migrator] — Migrate documents from one pandoc AST schema to another.
    + [pandoc/lua-filters] — A collection of Lua filters for pandoc:
        * [lua-debug-example] — Example of [debugging Lua filters] with the [ZeroBrane Studio] IDE.

<!-- MarkdownTOC:excluded -->
## Lua

Pandoc v2.x includes a Lua 5.3 interpreter and library built into the pandoc executable.

- [www.lua.org] — Lua website:
    + [Lua 5.3 Reference Manual]
- [LuaBinaries] — Pre-compiled Lua libraries and executables.
- [ZeroBrane Studio] — Lightweight Lua IDE with native support for [debugging Lua filters] via the [MobDebug] package:
    + [Remote Debugging][ZeroBrane remote-debugging]
    + [Lua 5.3 Debugging][ZeroBrane Lua 5.3 Debugging]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[lightweight markup languages]: https://en.wikipedia.org/wiki/Lightweight_markup_language "Wikipedia » Lightweight markup language"

<!-- panodc -->

[pandoc]: https://pandoc.org "Visit pandoc website"
[pandoc.org]: https://pandoc.org "Visit pandoc website"

[Pandoc User's Guide]: https://pandoc.org/MANUAL.html "Pandoc User's Guide"
[custom writer]: https://pandoc.org/MANUAL.html#custom-writers "Pandoc User's Guide » Custom writers"
[Custom writers]: https://pandoc.org/MANUAL.html#custom-writers "Pandoc User's Guide » Custom writers"

[Pandoc filters]: https://pandoc.org/filters.html

[Pandoc Lua Filters]: https://pandoc.org/lua-filters.html "Pandoc documentation on Lua Filters"
[Lua type reference]: https://pandoc.org/lua-filters.html#lua-type-reference
[Debugging Lua filters]: https://pandoc.org/lua-filters.html#debugging-lua-filters

<!-- pandoc GitHub -->

[jgm/pandoc]: https://github.com/jgm/pandoc
[github.com/pandoc]: https://github.com/pandoc

[pandoc/lua-filters]: https://github.com/pandoc/lua-filters "A collection of Lua filters for pandoc"
[lua-debug-example]: https://github.com/pandoc/lua-filters/tree/master/lua-debug-example

[pandoc/ast-migrator]: https://github.com/pandoc/ast-migrator

<!-- Lua -->

[Lua]: https://www.lua.org "Lua website"
[www.lua.org]: https://www.lua.org "Lua website"

[Lua 5.3 Reference Manual]: https://www.lua.org/manual/5.3/

[ZeroBrane]: https://studio.zerobrane.com "ZeroBrane Studio website"
[ZeroBrane Studio]: https://studio.zerobrane.com "ZeroBrane Studio website"
[ZeroBrane remote-debugging]: https://studio.zerobrane.com/doc-remote-debugging "ZeroBrane documentation on Remote Debugging"
[ZeroBrane Lua 5.3 Debugging]: https://studio.zerobrane.com/doc-lua53-debugging "ZeroBrane documentation on Lua 5.3 Debugging"

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


<!-- EOF -->
