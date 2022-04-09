set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
  set -x MOZ_ENABLE_WAYLAND 1
  source /opt/asdf-vm/asdf.fish
end

alias ls="exa --icons"
alias g="lazygit"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# If running from tty1 start sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway

