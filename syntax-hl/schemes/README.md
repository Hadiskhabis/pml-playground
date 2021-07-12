# Colour Schemes

Shared colour schemes assets for the various syntax highlighters and their code themes.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [The Schemes](#the-schemes)
    - [PML Test Scheme](#pml-test-scheme)
    - [Gogh Flat Scheme](#gogh-flat-scheme)
- [Credits](#credits)
    - [Gogh Flat](#gogh-flat)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- `schemes.cifc` — [ColorImpact 4] palettes source project.
- [`specs_gogh-flat.txt`][sp_gogh-flat] — Gogh Flat colours specs sheet.
- [`specs_pml-test-theme.txt`][sp_pml-test-theme] — PML Test Theme colours specs sheet.
- [`swatches_gogh-flat.png`][sw_gogh-flat] — Gogh Flat palette swatches.
- [`swatches_pml-test-theme.png`][sw_pml-test] — PML Test Theme palette swatches.

The `specs_*.txt` and `swatches_*.png` files are generated via __[ColorImpact 4]__ export interface.

All PNG images are optimized using the __[imagemin-power-cli]__ tool (Node.js), to reduce their size:

    imagemin-power *.png -o ./


# The Schemes

These are the colour schemes used in our syntax highlighters' themes for PML.

The `schemes.cifc` binary file is the source project containing all the schemes palettes, created with __[ColorImpact 4]__, a commercial software for editing colours.

## PML Test Scheme

- [`specs_pml-test-theme.txt`][sp_pml-test-theme]
- [`swatches_pml-test-theme.png`][sw_pml-test]

This colour scheme is used for testing the PML syntax; it's merely functional and not aiming at beauty nor intended for use in production schemes.
Its colours are designed to be vibrant, highly contrasted with the black background, and easy to distinguish.

![PML Test Theme swatches][sw_pml-test]


## Gogh Flat Scheme

- [`specs_gogh-flat.txt`][sp_gogh-flat]
- [`swatches_gogh-flat.png`][sw_gogh-flat]

This scheme was taken from the [Gogh] project.
It provides a nice dark theme with plenty of colour choices to cover all the elements of a syntax.

![Gogh Flat scheme swatches][sw_gogh-flat]

It's intended for production, and this project uses in our custom CSS stylesheets for highlighting PML code blocks.


# Credits

Third party components and assets used in this directory tree.

## Gogh Flat

Our custom syntax highlighter theme uses [Gogh]'s __Flat__ colour scheme:

- https://github.com/Mayccoll/Gogh/blob/master/themes/flat.sh

which was based on the __Flat UI Terminal Theme__ by [Ahmet Sülek]:

- https://dribbble.com/shots/1021755-Flat-UI-Terminal-Theme
- https://github.com/ahmetsulek/flat-terminal

whose colours were based on the __Flat UI kit__ by [Designmodo], released under MIT License:

- https://designmodo.github.io/Flat-UI
- https://github.com/designmodo/Flat-UI

```
The MIT License

Copyright (c) 2013-2018 Designmodo

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
```


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[ColorImpact 4]: https://www.tigercolor.com/ColorImpact.htm "Visit ColorImpact homepage at Tiger Color website"
[Gogh]: https://mayccoll.github.io/Gogh/ "Visit Gogh website"
[imagemin-power-cli]: https://www.npmjs.com/package/imagemin-power-cli "imagemin-power-cli homepage at NPM"

<!-- project files -->

[sw_gogh-flat]: ./swatches_gogh-flat.png "Gogh Flat palette swatches"
[sw_pml-test]: ./swatches_pml-test-theme.png "PML Test Theme palette swatches"

[sp_gogh-flat]: ./specs_gogh-flat.txt "Gogh Flat palette specs sheet"
[sp_pml-test-theme]: ./specs_pml-test-theme.txt "PML Test Theme palette specs sheet"

<!-- people and orgs -->

[Ahmet Sülek]: https://github.com/ahmetsulek "View Ahmet Sülek's GitHub profile"
[Designmodo]: https://github.com/designmodo "View Designmodo's GitHub profile"

<!-- EOF -->
