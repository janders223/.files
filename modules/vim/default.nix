{ pkgs, ... }:

{
  package = pkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
      packages = {
        darwin = {
          start = import ./packstart.nix { inherit pkgs; };
          opt = import ./packopt.nix { inherit pkgs; };
        };
      };
      customRC = builtins.readFile ./vimrc;
    };
  };
}

