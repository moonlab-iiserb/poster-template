# latexmk config for main.tex (LuaLaTeX poster).
# Works the same from a terminal (`latexmk`, `make`) and from
# neovim + VimTeX (`:VimtexCompile`, single-shot or continuous).

# --- Engine: LuaLaTeX is required (fontspec/Fira Sans/Noto Sans).
# $pdf_mode = 4 selects lualatex; the command keeps latexmk's %O/%S
# placeholders so CLI options (e.g. VimTeX's) are forwarded.
$pdf_mode = 4;
$lualatex = 'lualatex -synctex=1 -file-line-error %O %S';

# --- Bibliography: classic BibTeX on references.bib ---
$bibtex_use = 2;

# --- Beamer auxiliary files ---
$clean_ext = "nav snm";

# --- Accurate dependency tracking (also helps VimTeX continuous mode) ---
$recorder = 1;

# --- Add colorthemes directory to TeX search path ---
$ENV{'TEXINPUTS'} = './colorthemes//:' . ($ENV{'TEXINPUTS'} || '');

# --- Interaction mode: deliberately NOT forced here. ---
# VimTeX appends -interaction=nonstopmode itself, so its background and
# continuous (-pvc) compiles never block on an error prompt, and errors
# land in the quickfix list via -file-line-error.
# A plain terminal run (`latexmk` / `make`) therefore defaults to
# errorstopmode: on an error you get the interactive `?` prompt.
# To force non-interactive terminal builds, pass it explicitly:
#   latexmk -interaction=nonstopmode main.tex
