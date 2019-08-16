{ pkgs }:

{
  enable = true;
  tmuxConfig = import ./tmux.conf.nix { tmuxPlugins = pkgs.tmuxPlugins; };
}
