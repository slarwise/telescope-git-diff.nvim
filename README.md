# telescope-git-diff.nvim

A [Telescope](https://github.com/nvim-telescope/telescope.nvim) extension for
viewing the diffs for each file against a certain commit or ref.

## Setup

To install the extension, do

```lua
require('telescope').load_extension('git_diff')
```

## Usage

Call it using the `Telescope` command with the optional diff_against argument:

```vim
:Telescope git_diff diff_against=main
```

Pressing enter on a file will go to that file. The usual Telescope mappings for
file pickers such as `<C-x>` for opening a file in a horizonal split work as
usual.
