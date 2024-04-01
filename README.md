# center-comment.vim

A very small vim plugin (which used to be part of my `.vimrc` file) used to
align comments centrally:

```sh
#                              AN EXAMPLE COMMENT                              #
# ------------------- ANOTHER ONE, THIS TIME MORE STYLISH -------------------- #
# ooooooooooooooooooooo WHICHEVER CHAR YOU WANT, REALLY oooooooooooooooooooooo #
```

- Capitalise text in comment string
- Use any character to *highlight* the comment (see [Usage](#usage) examples)
- Change the width of your comment char (see [Change text width](#change-text-width))
- ~~Deal with multi-line comments~~
- ~~Deal with comments longer than 75 chars~~
- ~~Multiple character highlight chars~~

## Installation

Install with your favourite vim/neovim package manager.

## Usage

Running the following command on a line containing `example comment string`:

```vimrc
:CenterComment ~
```

...will produce the following:

```sh
# ~~~~~~~~~~~~~~~~~~~~~~~~~~ EXAMPLE COMMENT STRING ~~~~~~~~~~~~~~~~~~~~~~~~~~ #
```

If you omit the `~` there will be default blank space between the comment string
and the text you want to center. You can use any character in place of the
tilde, but it will probably not work well with multiple characters used.

### Mapping

You can define a keybinding for a certain version like any other command!

```vimrc
nn <leader>c- :CenterComment -<cr>
```

Or...

```lua
vim.keymap.set("n", "<leader>c-", ":CenterComment -<cr>")
```

There is also a [useful Lua function](examples/useful-function.lua) to remap all
values, so (for example) `<leader>ccX` (where `X` is any other character) will
call `:CenterComment X`.

### Change text width

Width of the comment is set in the following precedence:

- Setting the `g:center_comment_width` global variable
    - Lua equivalent is `vim.g.center_comment_width = 50`
- `textwidth`
    - Example `:se tw=50`
- `colorcolumn`
    - Example `:se cc=50`
    - Always takes the first `colorcolumn` value provided (colour column can be
      a list of values)
- Default (80 chars)

### Further customisation

There are a few other variables which can be used to customise the functionality
of this plugin. Here are the default values:

| Variable                            | Description                                                                                   | Default |
| ---                                 | ---                                                                                           | ---     |
| `center_comment_uppercase`          | Whether or not output comment should be uppercase                                             | `true`  |
| `center_comment_disable_mirror_end` | Whether or not to append any line with a single comment character with another (mirroring it) | `true`  |

## Disclaimer

I wrote this a fairly long time ago and had a fascination with the vim short
name versions of the language...

```vim
fun! example() abort
  if normal
    echom "fun/endfun is somewhat amusing..."
  elsei bizarre
    echon "elsei is pretty unbelievable..."
  el
    echom "just your classic if/elsei/el/en..."
  en
endfun
```

Although I've made changes to it since then, this hasn't changed... I should
probably change it but I've stuck with it for the fun.

## License

MIT. Please see the [License](/LICENSE) file in the root of this repo.
