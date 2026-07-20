# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Usage

Each top-level directory is a stow package. To activate a single package, run from the repo root:

```sh
stow <package>
```

**Example** — activate the `nvim` config:

```sh
stow nvim
```

This creates symlinks from `~/.config/nvim/` pointing into `nvim/.config/nvim/`.

To update symlinks after files were added or moved within a package:

```sh
stow -R nvim
```

To remove a package's symlinks:

```sh
stow -D nvim
```

## Packages

| Package    | Config path              |
|------------|--------------------------|
| hyprland   | `~/.config/hypr/`        |
| hyprlock   | `~/.config/hypr/`        |
| hyprpaper  | `~/.config/hypr/`        |
| nushell    | `~/.config/nushell/`     |
| nvim       | `~/.config/nvim/`        |
| swaync     | `~/.config/swaync/`      |
| terminator | `~/.config/terminator/`  |
| waybar     | `~/.config/waybar/`      |
| wofi       | `~/.config/wofi/`        |
