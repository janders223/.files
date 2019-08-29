with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "Docker";
  sourceRoot = "Docker.app";

  buildInputs = [ undmg ];

  installPhase = ''
    mkdir -p "$out/Applications/${name}.app"
    cp -pR * "$out/Applications/${name}.app"
  '';

  src = fetchurl {
    url = https://download.docker.com/mac/stable/Docker.dmg;
    sha256 = "06nhg3hddzn3l7yky36drypjkcvbbc2qbyazkjj0i0yq09knjf5n";
  };

  meta = with stdenv.lib; {
    description = ''
      Docker CE for Mac is an easy-to-install desktop app for building,
      debugging, and testing Dockerized apps on a Mac
    '';
    homepage = "https://store.docker.com/editions/community/docker-ce-desktop-mac";
    maintainers = with maintainers; [ janders223 ];
    platforms = platforms.darwin;
  };
}
