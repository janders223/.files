with import <nixpkgs> {};

let
  version = "7.5.0";

in stdenv.mkDerivation rec {
  name = "Postman";

  buildInputs = [ unzip ];

  src = fetchurl {
    url = "https://dl.pstmn.io/download/version/${version}/osx64";
    sha256 = "1s1yhwlvn55wgg2h5h3hy7p35rrcpq1snbl8ml70i5lw9zrdrfd2";
  };

  unpackCmd = "unzip -qq $curSrc";

  installPhase = ''
    mkdir -p "$out/Applications/${name}.app"
    cp -pR * "$out/Applications/${name}.app"
  '';

  meta = with stdenv.lib; {
    description = "Postman Leads the Way in the API-first Universe";
    homepage = "https://www.getpostman.com";
    maintainers = with maintainers; [ janders223 ];
    platforms = platforms.darwin;
  };

  #phases = ["unpackPhase" "installPhase"];
}

