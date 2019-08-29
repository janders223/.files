{ pkgs, home }:

rec {
  TERM = "screen-256color";
  LANG = "en_US.UTF-8";
  LC_ALL = LANG;
  LESSCHARSET = "utf-8";
  EDITOR = "${pkgs.vim}";
  GOROOT = [ "${pkgs.go.out}/share/go" ];
  GOPATH = "${home}/go";
  PATH = "/etc/per-user/bin:$PATH";
}
