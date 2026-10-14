# Docker Devcontainer (VS Code)

Build the poster with zero local TeX installation. Requires Docker, VS Code,
and VS Code's **Dev Containers** extension.

> The container is currently **untested** — if the build breaks inside it,
> please note down the error and report it.

## Steps

1. Open the `poster-template` folder in VS Code.
2. `Ctrl+Shift+P` → **Dev Containers: Reopen in Container**.
   - First launch downloads the base image + TeX Live layers; takes a while.
3. In the container terminal (`Terminal → New Terminal`):
   ```bash
   make main.pdf
   ```
4. The PDF appears in the project root. With the preinstalled
   LaTeX Workshop extension you can also build with `Ctrl+Alt+B` and preview
   with `Ctrl+Alt+V`.

## What's inside

- [.devcontainer/Dockerfile](../.devcontainer/Dockerfile) — Ubuntu-based image
  with the TeX Live packages from [GETTING_STARTED](GETTING_STARTED.md#option-a-native-tex-live)
  (`texlive-latex-extra`, `texlive-fonts-*`, `lmodern`, `texlive-luatex`,
  `texlive-xetex`, `latexmk`, `make`).
- [.devcontainer/devcontainer.json](../.devcontainer/devcontainer.json) —
  wires up the Dockerfile, installs LaTeX Workshop, opens PDFs in a tab.

Rebuilding after Dockerfile changes: `Ctrl+Shift+P` →
**Dev Containers: Rebuild Container**.
