# Helix Vim Keybindings Cheatsheet

Helix uses vim-style bindings but with a **select-then-act** model (opposite of vim's verb-then-noun).

## Movement

| key | action |
|-----|--------|
| `h/j/k/l` | left/down/up/right |
| `w` | next word start |
| `b` | previous word start |
| `e` | next word end |
| `0` | start of line |
| `gl` | end of line |
| `gg` | top of file |
| `ge` | bottom of file (vim's `G`) |
| `Ctrl+d / Ctrl+u` | half page down/up |
| `Ctrl+f / Ctrl+b` | full page down/up |
| `:<number>` | go to line number |
| `%` | jump to matching bracket |

## Selection

| key | action |
|-----|--------|
| `v` | extend selection (like vim visual) |
| `x` | select whole line (repeat to select more lines) |
| `X` | extend line selection upward |
| `s` | select within selection (regex search inside) |
| `S` | split selection by regex |
| `,` | collapse selection to single cursor |
| `;` | collapse selection, keep cursor |
| `C` | copy selection below (multi-cursor) |
| `Alt+C` | copy selection above (multi-cursor) |

## Editing

| key | action |
|-----|--------|
| `i` | insert before cursor |
| `a` | insert after cursor |
| `I` | insert at line start |
| `A` | insert at line end |
| `o` | new line below |
| `O` | new line above |
| `d` | delete selection |
| `c` | change selection (delete + insert) |
| `r` | replace selection with char |
| `u` | undo |
| `U` | redo |
| `.` | repeat last insert |
| `>` / `<` | indent / dedent |
| `J` | join lines |
| `~` | toggle case |

## Copy/Paste (yanking)

| key | action |
|-----|--------|
| `y` | yank (copy) selection |
| `p` | paste after |
| `P` | paste before |
| `R` | replace selection with paste |
| `"_d` | delete without yanking (black hole register) |
| `"+y` | yank to system clipboard |
| `"+p` | paste from system clipboard |

## Search & Find

| key | action |
|-----|--------|
| `/` | search forward |
| `?` | search backward |
| `n` | next match |
| `N` | previous match |
| `*` | search for word under cursor |
| `f<char>` | find next char on line |
| `t<char>` | till next char on line |
| `F<char>` / `T<char>` | reverse find/till |

## File & Buffer

| key | action |
|-----|--------|
| `space+f` | file picker (fuzzy find) |
| `space+b` | buffer picker (switch open files) |
| `space+g` | lazygit |
| `:o <path>` | open file |
| `:w` | save |
| `:q` | quit |
| `:wq` | save and quit |
| `:bc` | close buffer |
| `:bn` / `:bp` | next/prev buffer |

## Space Menu (leader key)

| key | action |
|-----|--------|
| `space+f` | file picker |
| `space+b` | buffer picker |
| `space+s` | symbol picker (functions, classes) |
| `space+S` | workspace symbol picker |
| `space+d` | diagnostics (errors/warnings) |
| `space+r` | rename symbol (LSP) |
| `space+a` | code action (LSP) |
| `space+k` | hover docs |
| `space+y` | yank to clipboard |
| `space+p` | paste from clipboard |

## Goto Menu (`g` prefix)

| key | action |
|-----|--------|
| `gd` | go to definition |
| `gr` | go to references |
| `gi` | go to implementation |
| `gy` | go to type definition |
| `gl` | go to end of line |
| `gh` | go to start of line |
| `gs` | go to first non-blank |
| `gt` | go to top of screen |
| `gb` | go to bottom of screen |
| `gc` | go to center of screen |

## The Big Difference from Vim

In vim: **verb then noun** → `d3w` (delete 3 words)

In helix: **select then act** → `3w` then `d` (select 3 words, then delete)

You always **see what you're about to change** before you change it.

### Quick Examples

Delete a function:
1. `x` repeatedly to select lines (or `v` then move)
2. `d` to delete

Search-replace inside a selection:
1. `x` to select lines
2. `s` to search within selection
3. `c` to change all matches
