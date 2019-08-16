with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "mas-${version}";
  version = "1.6.3";

  src = fetchurl {
    url = "https://github.com/mas-cli/mas/releases/download/v${version}/mas.pkg";
    sha256 = "1syzz8fpjb0jb7lgahd8v2zda6z8493ys19ml9nlaybh3ghvwlcc";
  };

  unpackCmd = "installer -pkgs $curSrc -target /";
}
