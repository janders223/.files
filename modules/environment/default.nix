{ pkgs, config, home }:

{
  darwinConfig = "${home}/src/dotfiles/default.nix";
  etc = import ./etc.nix { inherit pkgs; };
  shells = [ pkgs.zsh ];
  shellAliases =   import ./aliases.nix;
  systemPackages = import ./packages.nix { inherit pkgs config; };
  variables = import ./variables.nix { inherit pkgs home; };
}
