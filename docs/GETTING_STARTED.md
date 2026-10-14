# Getting Started: Your First Poster

This guide takes you from zero to a compiled A0 poster. You only ever edit
four files; everything else is machinery. (~20 minutes the first time.)

## Step 0 — Pick your build path

### Option A: native TeX Live

(You have — or are willing to install — ~1 GB of TeX.)
You need `lualatex`, `latexmk`, and `bibtex` — on Ubuntu:

```bash
sudo apt-get install -y texlive-latex-extra texlive-fonts-recommended \
  texlive-fonts-extra lmodern texlive-luatex texlive-xetex latexmk
```

### Option B: Docker devcontainer (recommended if you have no TeX installation)

You need Docker, VS Code, and VS Code's **Dev Containers** extension. Full
steps: [DEVCONTAINER](DEVCONTAINER.md).

> The devcontainer is currently **untested** — if the build breaks inside it,
> please note down the error and report it.

### Option C: Overleaf (no installation at all)

See [OVERLEAF](OVERLEAF.md): upload a zip, set Compiler → LuaLaTeX and Main
document → `main.tex`, recompile. The steps below apply unchanged once it builds.

## Step 1 — Get the template and verify the build

```bash
# clone (or copy) the repo, then:
cd poster-template
make main.pdf
```

Open `main.pdf`. You should see the placeholder poster with the dark indigo
headline bar. If the build fails, see [TROUBLESHOOTING](TROUBLESHOOTING.md).

- **Devcontainer path:** open the `poster-template` folder in VS Code,
  press `Ctrl+Shift+P`, run **Dev Containers: Reopen in Container**, wait for
  the image to build (first time takes a while — it downloads TeX Live),
  then run `make main.pdf` in the container terminal (`Terminal → New Terminal`).
  The PDF appears in the project root; with LaTeX Workshop installed you can
  also build with `Ctrl+Alt+B` and preview with `Ctrl+Alt+V`.
- **neovim + VimTeX path:** no configuration needed — `.latexmkrc` already
  selects LuaLaTeX. `:VimtexCompile` for one-shot, or continuous mode for
  live rebuilds on save.

## Step 2 — Title, conference, contact (`meta/info.tex`)

Open `meta/info.tex` and set:

| Variable | Example |
|---|---|
| `\posterTitle` | Your poster title |
| `\posterConference` | `ICRA 2026, Atlanta` (center of footer) |
| `\posterEmail` | Corresponding author's email (right of footer) |

Leave `\posterWebsiteURL` / `\posterWebsiteDisplay` alone — the website is
always `https://moonlab.iiserb.ac.in`.

## Step 3 — Authors (`meta/authors.tex`)

One `\author` line per author; the optional argument is the affiliation
number. One `\affil` line per affiliation number:

```latex
\author[1]{First Author}
\author[1,2]{Second Author}   % shared + second affiliation
\author[2]{Third Author}

\affil[1]{Multi-Robot Autonomy Lab, IISER Bhopal}
\affil[2]{Collaborator Institute}
```

Add as many authors as you need — no other file changes required.

## Step 4 — Body content (`sections/_index.tex`)

Replace the placeholder blocks with your own. The available building blocks:

- `\begin{block}{Title} … \end{block}` — normal content (white body).
- `\begin{alertblock}{…}` — exactly **one** per poster, for the key takeaway
  (pale cream body, pink rule).
- `\begin{exampleblock}{…}` — highlighted math/definitions (pale blue body).
- Figures: `tikz` diagrams and `pgfplots` plots — use theme colors
  (`spaceindigo` + `bubblegum` for contrasting series, `thick` lines).
- Tables: `booktabs` (`\toprule` / `\midrule` / `\bottomrule`), black on white.
- `\begin{block}{References}` at the end + entries in `references.bib`.

Keep each column roughly the same length.

## Step 5 — Rebuild and check for overflow

```bash
make main.pdf
```

Then check the log:

```bash
grep -i "overfull" main.log
```

Any `Overfull \vbox (... too high)` means content spills off the page — trim
text or shrink a figure in `sections/_index.tex` until the warning is gone.
(One `Underfull` here and there is harmless.)

## Step 6 — Make it cohesive, not a circus ad

Read [palette.pdf](palette/palette.pdf), page 2 (2 minutes). The short version:
indigo does the work, white dominates, glaucous is the only repeating accent,
pink marks one thing, lemon stays in tints (except footer links). If you add a
plot series, use `spaceindigo` vs `bubblegum` — never the raw `red`/`blue` defaults.

## Step 7 (optional) — Change size, logos, fonts

See [CUSTOMIZING](CUSTOMIZING.md): `beamerposter` size options in `main.tex`,
`\logoleft` / `\logoright` logo heights, and the font setup in
`beamerthemegemini.sty`.

## Done — printing checklist

- [ ] `grep -i overfull main.log` is clean
- [ ] Authors, affiliations, email, conference line correct
- [ ] One alert block max; pink used once
- [ ] References resolve (no `?` in the PDF)
- [ ] Export/print at 100% scale (A0) — check with the print shop
