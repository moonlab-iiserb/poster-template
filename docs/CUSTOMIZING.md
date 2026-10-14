# Customizing the Template

## What to edit

| File | Purpose — edit this for… |
|---|---|
| `main.tex` | Orchestrator only: paper size, logo placement, footer. Rarely needs changes. |
| `meta/info.tex` | Title, conference line, website, contact email. |
| `meta/authors.tex` | Authors + affiliations via `authblk` (`\author[n]{…}` / `\affil[n]{…}`, any number of authors). |
| `sections/_index.tex` | All poster body content: blocks, figures, tables, references. |
| `references.bib` | Bibliography entries. |
| `colorthemes/beamercolorthemeiiserb.sty` | The color theme (source of truth for colors). |
| `beamerthemegemini.sty` | Fonts and headline/block layout. |
| `figures/logos/` | IISERB crest (left) and MoonLab wordmark (right). |

`main.tex` pulls it all together with `\input{meta/info.tex}`,
`\input{meta/authors.tex}`, and `\input{sections/_index.tex}`.

## Paper size

Set in `main.tex` via the `beamerposter` options:

```latex
\usepackage[size=custom,width=118.9,height=84.1,scale=1.0]{beamerposter}
```

`width=118.9,height=84.1` = **A0 landscape**. After resizing, rebalance
`\sepwidth` / `\colwidth` so that
`(N+1)*\sepwidth + N*\colwidth = \paperwidth`, and re-check for
`Overfull \vbox` in the log.

## Color theme

The active theme is `iiserb`, selected in `main.tex` with
`\usecolortheme{iiserb}`. Colors and the full usage rationale live in
`colorthemes/beamercolorthemeiiserb.sty`; the visual reference is
[palette/palette.pdf](palette/palette.pdf) (swatches p. 1, do/don't guidance
p. 2; source: [palette/palette.tex](palette/palette.tex) — rebuild it after
any theme color change). Footer links use full-strength `lemonchiffon`
(readable on the dark bar); body links use `glaucousdark`.

## Fonts

Fira Sans (titles, from TeX Live) + Noto Sans (body), configured in
`beamerthemegemini.sty`. To switch the body font (e.g. back to Lato), use the
commented-out block in that file.

## Logos

`\logoleft` (IISERB, `height=7.5cm`) and `\logoright` (MoonLab white variant
for the dark bar, `height=3.2cm`) in `main.tex`. The heights differ
deliberately — a square crest and a wide wordmark need different heights to
look balanced. Both PNGs have transparent backgrounds.
