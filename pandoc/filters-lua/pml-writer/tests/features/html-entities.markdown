---
title: 'HTML Entities'
subtitle: "Test how entities are rendered."
author: Tristano Ajmone
date: 2022-11-14
...

Any HTML entities present in the source file are handled by pandoc, so the AST will receive them as literal characters.

# Hex Character References

- &#xE0; (à)
- &#xE8; (è)
- &#xEC; (ì)
- &#xF2; (ò)
- &#xF9; (ù)

# Decimal Character References

- &#224; (à)
- &#232; (è)
- &#236; (ì)
- &#242; (ò)
- &#249; (ù)

# Named Character References

- &agrave; (à)
- &egrave; (è)
- &igrave; (ì)
- &ograve; (ò)
- &ugrave; (ù)
