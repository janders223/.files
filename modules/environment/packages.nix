{ pkgs, config }:

with pkgs; [
  config.programs.vim.package

  alacritty
  cacert
  consul
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
  lua
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

  (import ../../pkgs/spectacle)
  (import ../../pkgs/postman)
  (import ../../pkgs/docker)
]
