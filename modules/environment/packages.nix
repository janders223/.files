{ pkgs, config }:

with pkgs; [
  config.programs.vim.package

  alacritty
  cacert
  ctags
  curl
  direnv
  fzf
  git
  gnugrep
  gnumake
  go
  gitAndTools.hub
  less
  nix-zsh-completions
  nodejs
  reattach-to-user-namespace
  shellcheck
  wget
  yarn
  zsh
  zsh-syntax-highlighting

  tmuxPlugins.nord
  tmuxPlugins.vim-tmux-navigator

  Spectacle
  (import ../../pkgs/postman)
]