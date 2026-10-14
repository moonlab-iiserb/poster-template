# MoonLab Poster Template

[![CI](https://github.com/moonlab-iiserb/poster-template/actions/workflows/ci.yml/badge.svg)](https://github.com/moonlab-iiserb/poster-template/actions/workflows/ci.yml)

An academic poster template (A0 landscape) for the Multi-Robot Autonomy Lab,
IISER Bhopal. Built on the Gemini [beamerposter] theme with a custom `iiserb`
color theme, Fira Sans titles + Noto Sans body, and `authblk` author handling.

![Preview of the compiled poster template](docs/poster-preview.png)

## Docs

| Start here | |
|---|---|
| [Getting Started](docs/GETTING_STARTED.md) | Zero-to-printed-poster walkthrough (your first stop). |
| [Building](docs/BUILDING.md) | `make`, `latexmk`, VimTeX, VS Code, CI. |
| [Overleaf](docs/OVERLEAF.md) | Using the template on Overleaf (or similar online editors). |
| [Devcontainer](docs/DEVCONTAINER.md) | Docker-based build with VS Code, no local TeX needed. |
| [Customizing](docs/CUSTOMIZING.md) | What-to-edit map, paper size, theme, fonts, logos. |
| [Palette sheet](docs/palette/palette.pdf) | Color swatches (p. 1) + cohesion guidance (p. 2). |
| [Troubleshooting](docs/TROUBLESHOOTING.md) | Common errors and fixes. |

## Quick start

```bash
make main.pdf        # builds main.pdf (LuaLaTeX via latexmk, see .latexmkrc)
make clean           # removes build artifacts
```

No TeX installed? See [Overleaf](docs/OVERLEAF.md) or
[Devcontainer](docs/DEVCONTAINER.md).

## Credits & license

Poster machinery: Gemini theme by Anish Athalye ([beamerposter] upstream).
MoonLab customization (`iiserb` theme, fonts, layout): Multi-Robot Autonomy
Lab, IISER Bhopal. License: see [LICENSE.md](LICENSE.md).

[beamerposter]: https://github.com/deselaers/latex-beamerposter
