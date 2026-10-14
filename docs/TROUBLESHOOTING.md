# Troubleshooting

| Symptom | Fix |
|---|---|
| `File 'beamercolortheme….sty' not found` | Build via `make`/`latexmk` so `.latexmkrc` adds `colorthemes/` to `TEXINPUTS`; plain `lualatex` needs `TEXINPUTS='./colorthemes//:'` in the environment. |
| `fontspec` / font errors, or pdfLaTeX ran | Must compile with LuaLaTeX (`make`/`latexmk` already do; on Overleaf pick LuaLaTeX in Menu → Compiler — see [OVERLEAF](OVERLEAF.md)). |
| `Overfull \vbox` | Content taller than the page — cut text/figures in `sections/_index.tex`. |
| Authors/affiliations look wrong | Check `\author[n]` / `\affil[n]` numbering in `meta/authors.tex`. |
| Poster looks like a circus ad | Re-read [palette p. 2](palette/palette.pdf); pink and lemon each get one job. |
| `?` prompt blocks a terminal build | Normal for errorstopmode — fix the error or rerun with `latexmk -interaction=nonstopmode main.tex`. |
| CI artifact missing | Check the Actions tab log for the failing step (`xu-cheng/latex-action` needs `root_file: main.tex`). |
