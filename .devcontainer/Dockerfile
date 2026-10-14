# TeX Live environment for the MoonLab poster template.
# Package list mirrors the native-install list in docs/GETTING_STARTED.md
# (CI now uses a prebuilt TeX Live image instead). LuaLaTeX + beamerposter
# + fonts included.
FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    lmodern \
    texlive-luatex \
    texlive-xetex \
    latexmk \
    make \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# NOTE: this image is untested in CI (no time). If `make main.pdf`
# fails inside the container, compare with the CI package list and
# report the missing piece.
