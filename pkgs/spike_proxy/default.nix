with import <nixpkgs> {};

let
  version = "1.2";

in stdenv.mkDerivation rec {
  name = "Spike";

  buildInputs = [ unzip ];

  srcRoot = "Spike.app";

  src = fetchurl {
    url = "https://www.spikeproxy.com/updates/Spike-latest.zip";
    sha256 = "037kayakprzvs27b50r260lwh2r9479f2pd221qmdv04nkrmnvbn";
  };

  installPhase = ''
    mkdir -p "$out/Applications/${name}.app"
    cp -pR * "$out/Applications/${name}.app"
  '';

  meta = with stdenv.lib; {
    description = "Spike Proxy";
    homepage = "https://www.spikeproxy.com";
    maintainers = with maintainers; [ janders223 ];
    platforms = platforms.darwin;
  };
}



