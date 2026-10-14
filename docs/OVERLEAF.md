# Using This Template on Overleaf

Overleaf works, with two settings you must get right: the **compiler** and the
**main document**. Everything else (theme, fonts, bibliography) follows the
repo configuration.

## Setup (5 minutes)

1. **Zip the template.** Exclude `.git/`, `build/`, and existing PDFs
   (`main.pdf`); keep everything else, including `.latexmkrc`,
   `colorthemes/`, `meta/`, `sections/`, `figures/`, and `references.bib`.
2. **Upload.** Overleaf → New Project → Upload Project → select the zip.
3. **Set the compiler.** Project Menu (top-left ☰) → Settings → Compiler →
   **LuaLaTeX**. This is mandatory: the template uses `fontspec`
   (Fira Sans / Noto Sans), which pdfLaTeX cannot build.
4. **Set the main document.** Menu → Main document → **`main.tex`**.
5. **Recompile.** First build takes a while (font loading + BibTeX passes).

Overleaf reads the project's `.latexmkrc`, so the `iiserb` color theme in
`colorthemes/` resolves with no extra setup, and `references.bib` is picked
up by the automatic BibTeX run.

## Editing on Overleaf

- Edit `meta/info.tex`, `meta/authors.tex`, and `sections/_index.tex`
  exactly as in [GETTING_STARTED](GETTING_STARTED.md) — same files, same syntax.
- Add bibliography entries to `references.bib`; cite with `\cite{…}`.
- Upload figures via the file panel into `figures/` and include with
  `\includegraphics`.
- Collaborators: use Share + Track Changes / comments as usual; the
  placeholder "Poster palette" block and the PDF in
  `docs/palette/palette.pdf` help co-authors stick to the colors.

## Caveats

- **Fonts:** Fira Sans and Noto Sans come from TeX Live and resolve on
  Overleaf's full installation. If you ever see a `fontspec` "font not found"
  error, fall back to the commented Lato block in `beamerthemegemini.sty`
  (or tell us — the theme may need a portable tweak).
- **Compile timeout:** free Overleaf projects time out on long builds. An A0
  LuaLaTeX poster with BibTeX is usually fine; if a build times out, clear
  cached files (Menu → Clear Cached Files) and recompile, or build locally.
- **Syncing back:** Overleaf has Git integration (paid plans) or download the
  source zip from Menu → Download → Source. Do not commit `build/` output or
  the downloaded `main.pdf` — both are git-ignored here.

## Similar services

Any online LaTeX editor works if it supports these three things (Overleaf
does all three):

1. **LuaLaTeX engine** selectable per project (pdfLaTeX will fail on fonts).
2. **BibTeX runs** (classic `\bibliography{references}`, not biber).
3. **`latexmkrc` support** (or a way to add `colorthemes/` to `TEXINPUTS`),
   with `main.tex` settable as the root document.
