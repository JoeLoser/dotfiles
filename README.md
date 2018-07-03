# Summary

These are my personal dotfiles for vim, tmux, zsh, and the like. The idea is to
just be able to clone these and be off and running on a new machine when I need
to access my usual development setup.

## Symlinks
Most rc files expect to live in `$HOME`. As such, having some symlinks to things
in this repo would be helpful. For example:

```
$HOME/.vim -> this_repo/vim
.tmux.conf -> this_repo/tmux/.tmux.conf
```

## Vim
Note that we use `$HOME/.vim/backup` as the location where we store swap files.
So make sure to manually create this directory when cloning for the first time.
Otherwise, you will get errors when saving files as the saving of swap files
will not succeed.
