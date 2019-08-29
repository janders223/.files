{ config, pkgs, ... }:

let
  home = builtins.getEnv "HOME";
  pureZshPrompt = pkgs.fetchgit {
    url = "https://github.com/sindresorhus/pure";
    rev = "e7036c43487fedf608a988dde54dd1d4c0d96823";
    sha256 = "10mdk4dn2azzrhymx0ghl8v668ydy6mz5i797nmbl2ijx9hlqb3v";
  };

in {
  networking.hostName = "midgard";

  environment = import ./modules/environment { inherit pkgs config home; };

  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [ fira-code ];

  services.nix-daemon.enable = true;

  programs.bash.enable = true;

  programs.tmux = import ./modules/tmux { inherit pkgs; };

  programs.vim = import ./modules/vim { inherit pkgs; };

  programs.zsh = import ./modules/zsh { inherit home; };

  system = {
    activationScripts = {
      extraUserActivation.text = ''
           for file in /etc/per-user/.git_template/hooks/*; do
             sudo chmod a+x $file
           done
           for file in /etc/per-user/bin/*; do
             sudo chmod a+x $file
           done
           ln -sfn /etc/per-user/alacritty ~/.config/
           ln -sfn /etc/per-user/.zshrc ~/
           sudo ln -sfn /etc/per-user/.gitconfig "${home}"/.gitconfig
           mkdir -p ~/.cache/backup
           mkdir -p ~/.cache/swap
           mkdir -p ~/.cache/undo
           mkdir -p ~/.zfunctions
           ln -sfn ${pureZshPrompt}/pure.zsh ~/.zfunctions/prompt_pure_setup
           ln -sfn ${pureZshPrompt}/async.zsh ~/.zfunctions/async
      '';
    };
    stateVersion = 4;
    defaults = {
      NSGlobalDomain = {
        AppleFontSmoothing = 1;
        AppleKeyboardUIMode = 3;
        AppleMeasurementUnits = "Inches";
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Automatic";
        AppleTemperatureUnit = "Fahrenheit";
        InitialKeyRepeat = 12;
        KeyRepeat = 1;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };
      dock = {
        autohide = true;
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "left";
        show-recents = false;
        static-only = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
      };
      smb = {
        NetBIOSName = "midgard";
        ServerDescription = "midgard";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  nix = {
    maxJobs = 4;
    buildCores = 4;
    nixPath = [
      "nixpkgs=$HOME/src/nixpkgs"
    ];
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = false;
    };
    overlays =
    let path = ./overlays; in with builtins;
    map (n: import (path + ("/" + n)))
    (filter (n: match ".*\\.nix" n != null ||
    pathExists (path + ("/" + n + "/default.nix")))
    (attrNames (readDir path)));
  };
}
