# dwmm.vim

`dwmm.vim` is basically [`dwm.vim`](https://github.com/spolu/dwm.vim)-iMproved or
[`dwm.vim`](https://github.com/spolu/dwm.vim)-Minimal. I really wanted `dwm.vim` to work with
[Tagbar](http://majutsushi.github.io/tagbar/), but it wasn't happening. I wanted to fix `dwm.vim` myself,
but the use of standard window repositioning commands ended up confusing Tagbar about where it should open
up at.

This version doesn't use `wincmd (H|J|K|L)` to move windows around. Instead, it simply remembers some buffer numbers, closes windows, opens new splits, and edits buffers in the new windows. This seems to keep things sane while still letting vim do most of the work.

Currently supporting:

* opening a new editor pane
* focusing stacked panes

Those two commands account for 90% of what I do normally anyway. More docs to come, but they'd basically just
be copies of whatever `dwm.vim` has since I'm just trying to mirror all of the functions and what not.

