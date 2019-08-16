{ home }:

{
  enable = true;
  enableCompletion = true;
  enableBashCompletion = true;
  enableFzfCompletion = true;
  enableFzfGit = true;
  enableFzfHistory = true;
  enableSyntaxHighlighting = true;
  promptInit = ''
        fpath=( "${home}/.zfunctions" $fpath )
        autoload -U promptinit && promptinit && prompt pure
  '';
  interactiveShellInit = ''
        autoload -U up-line-or-beginning-search
        bindkey '^[[A' up-line-or-beginning-search
        zle -N up-line-or-beginning-search
  '';
}
