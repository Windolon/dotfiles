# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
. "$HOME/.cargo/env"

# Outputs a human readable output of env variables, especially when
# there are multiple entries.
# Usage:
#   echoenv $VARIABLE
echoenv() {
  tr ':' '\n' <<<$1
}

# Outputs the list of all installed rpm packages to ~/rpm_qa.txt, overwriting if it exists.
alias rpm-qa="rpm -qa > rpm_qa.txt"

# Activates the base conda environment.
alias do-conda-activate="~/miniconda3/bin/conda shell.bash hook"
alias conda-activate="eval $(do-conda-activate)"

# Opens the Alacritty config.
alias alacritty-config="nvim ~/.config/alacritty/alacritty.toml"

# Opens the tmux config.
alias tmux-config="nvim ~/.config/tmux/tmux.conf"

# Alias for git to handle dotfiles version tracking.
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
