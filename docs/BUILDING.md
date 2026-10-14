# Building the Poster

All build paths go through `latexmk`, configured by [.latexmkrc](../.latexmkrc)
(LuaLaTeX engine + `colorthemes/` search path + BibTeX). The PDF lands in the
project root as `main.pdf` (git-ignored).

## `make` (recommended)

```bash
make main.pdf        # full build: LuaLaTeX + BibTeX + reruns
make clean           # removes build artifacts
```

Native requirements: `lualatex`, `latexmk`, `bibtex` — on Ubuntu:

```bash
sudo apt-get install -y texlive-latex-extra texlive-fonts-recommended \
  texlive-fonts-extra lmodern texlive-luatex texlive-xetex latexmk
```

## Plain `latexmk`

```bash
latexmk -pdflua main.tex
```

Use `-pdflua` (not `-pdf`): `-pdf` would force the pdfLaTeX engine and the
`fontspec`-based build would fail. Terminal runs stay interactive — on an
error you get the `?` prompt. For non-interactive runs add
`-interaction=nonstopmode`.

> Do not call `lualatex` directly without `TEXINPUTS='./colorthemes//:'` in
> the environment, or the `iiserb` color theme won't be found
> (`File 'beamercolortheme….sty' not found`).

## neovim + VimTeX

No configuration needed: `:VimtexCompile` (single-shot) or continuous mode
(live rebuilds on save) both work out of the box. VimTeX appends
`-interaction=nonstopmode` itself, so errors land in the quickfix list
instead of blocking on a prompt.

## VS Code + LaTeX Workshop

Open the folder, build with `Ctrl+Alt+B`, preview with `Ctrl+Alt+V`. The
default latexmk recipe picks up `.latexmkrc`, so the engine needs no setup.
(This works natively and inside the [devcontainer](DEVCONTAINER.md).)

## CI (GitHub Actions)

Every push/PR builds `main.pdf` and the palette sheet with a prebuilt
TeX Live image ([`xu-cheng/latex-action`](https://github.com/xu-cheng/latex-action),
no package installs) and uploads the PDFs as artifacts. See
[../.github/workflows/ci.yml](../.github/workflows/ci.yml).

## After building

Check for overflow — content spilling off the page shows up as:

```bash
grep -i "overfull" main.log
```

Trim text/figures in `sections/_index.tex` until `Overfull \vbox` is gone.
