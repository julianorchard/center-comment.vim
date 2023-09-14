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
- Change the width of your comment char by either setting `textwidth` or
  `colorcolumn` (in that order of precedence)
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

### Change text width

Width of the comment is set in the following precedence:

- textwidth
- colorcolumn
- default (80 chars)

```html
Before textwidth set
<!--                       A NORMAL, 80 CHAR COMMENT                         -->
After textwidth set
<!--            A 50 CHAR COMMENT              -->
```

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

So yep, that was a mistake but not enough to change it (and I've kept using it
because *a.* I've come this far with it and *b.* consistency).

## License

MIT. Please see the [License](/LICENSE) file in the root of this repo.
