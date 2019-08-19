with import <nixpkgs> {};

let
  version = "1.2";

in stdenv.mkDerivation rec {
  name = "Spectacle";

  buildInputs = [ undmg unzip ];

  srRoot = "Spectacle.app";

  src = fetchurl {
    url = "https://s3.amazonaws.com/spectacle/downloads/Spectacle+${version}.zip";
    sha256 = "037kayakprzvs27b50r260lwh2r9479f2pd221qmdv04nkrmnvbn";
  };

  installPhase = ''
    mkdir -p "$out/Applications/${name}.app"
    cp -pR * "$out/Applications/${name}.app"
  '';

  meta = with stdenv.lib; {
    description = "Move and resize windows with ease.";
    homepage = "https://www.spectacleapp.com";
    maintainers = with maintainers; [ janders223 ];
    platforms = platforms.darwin;
  };
}


