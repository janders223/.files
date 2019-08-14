{ config, pkgs, ... }:

let
  home = "/Users/janders223";
  pureZshPrompt = pkgs.fetchgit {
    url = "https://github.com/sindresorhus/pure";
    rev = "e7036c43487fedf608a988dde54dd1d4c0d96823";
    sha256 = "10mdk4dn2azzrhymx0ghl8v668ydy6mz5i797nmbl2ijx9hlqb3v";
  };

in {
  networking = {
    hostName = "midgard";
  };

  environment = {
    darwinConfig = "$HOME/src/.files/default.nix";
    etc = {
      "per-user/alacritty/alacritty.yml".text = import ./config/alacritty.nix { zsh = pkgs.zsh; };
      "per-user/.gitconfig".text = import ./config/gitconfig.nix { home = home; };
      "per-user/.git_template/hooks/ctags".text = import ./config/git_template/ctags.nix { ctags = pkgs.ctags; };
      "per-user/.git_template/hooks/post-checkout".text = import ./config/git_template/post-checkout.nix;
      "per-user/.git_template/hooks/post-commit".text = import ./config/git_template/post-commit.nix;
      "per-user/.git_template/hooks/post-merge".text = import ./config/git_template/post-merge.nix;
      "per-user/.git_template/hooks/post-rewrite".text = import ./config/git_template/post-rewrite.nix;
      "per-user/.gitignore_global".text = import ./config/gitignore.nix;
    };
    shells = [ pkgs.zsh ];
    shellAliases = {
      la = "ls -halF";
      rebuild = "darwin-rebuild switch";
      edit = "$(which vim) ${home}/src/.files/**/*.nix";
      git = "$(which hub)";
    };
    systemPackages = with pkgs; [
      config.programs.vim.package

      #_1Password

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
      wget
      yarn
      zsh
      zsh-syntax-highlighting

      tmuxPlugins.nord
      tmuxPlugins.vim-tmux-navigator

      Spectacle
    ];
    variables = rec {
      TERM = "screen-256color";
      LANG = "en_US.UTF-8";
      LC_ALL = LANG;
      LESSCHARSET = "utf-8";
      EDITOR = "${pkgs.vim}";
    };
  };

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      fira-code
    ];
  };

  services = {
    nix-daemon = {
      enable = true;
    };
  };

  programs = {
    bash = {
      enable = true;
      #enableCompletion = true;
    };
    tmux = {
      enable = true;
      tmuxConfig = import ./config/tmux.nix { tmuxPlugins = pkgs.tmuxPlugins; };
    };
    vim = {
      package = pkgs.vim_configurable.customize {
        name = "vim";
        vimrcConfig = {
          packages = {
            darwin = {
              start = with pkgs.vimPlugins; [
                nord-vim
                vim-airline
                vim-fugitive
                vim-nix
                vim-surround
                vim-tmux-navigator
              ];
              opt = with pkgs.vimPlugins; [];
            };
          };
          customRC = import ./config/vimrc.nix;
        };
      };
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      enableFzfCompletion = true;
      enableFzfGit = true;
      enableFzfHistory = true;
      enableSyntaxHighlighting = true;
      promptInit = ''
        fpath=( "$HOME/.zfunctions" $fpath )
        autoload -U promptinit && promptinit && prompt pure
      '';
      interactiveShellInit = ''
        autoload -U up-line-or-beginning-search
        bindkey '^[[A' up-line-or-beginning-search
        zle -N up-line-or-beginning-search
      '';
    };
  };

  system = {
    activationScripts = {
      extraUserActivation.text = ''
           ln -sfn /etc/per-user/alacritty ~/.config/
           ln -sfn /etc/per-user/.gitconfig ~/
           ln -sfn /etc/per-user/.git_template ~/
           ln -sfn /etc/per-user/.gitignore_globa ~/
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
      "nixpkgs=$HOME/src/.files/nixpkgs"
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
