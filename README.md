# Get the config

```bash
# Thanks to https://www.atlassian.com/git/tutorials/dotfiles

alias config="/usr/bin/git --git-dir=$HOME/.config/.cfg  --work-tree=$HOME/.config"
git clone --bare https://github.com/Windolon/.config.git $HOME/.config/.cfg
config checkout # Resolve conflicts here
config config --local status.showUntrackedFiles no
```

# Dependencies

## Main apps

```bash
# TODO
```
