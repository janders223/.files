self: super: {

  installApplication = 
  { name, appname ? name, version, src, description, homepage, 
  postInstall ? "", sourceRoot ? ".", ... }:
  with super; stdenv.mkDerivation {
    name = "${name}-${version}";
    version = "${version}";
    src = src;
    buildInputs = [ undmg unzip ];
    sourceRoot = sourceRoot;
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications/${appname}.app"
      cp -pR * "$out/Applications/${appname}.app"
    '' + postInstall;
    meta = with stdenv.lib; {
      description = description;
      homepage = homepage;
      maintainers = with maintainers; [ janders223 ];
      platforms = platforms.darwin;
    };
  };

  # Unsure of how to properly unpack and install .pkg file, will circle back to this
  _1Password = self.installApplication rec {
    name = "1Password";
    version = "OPM7";
    sourceRoot = "1Password.app";
    src = super.fetchurl {
       url = "https://app-updates.agilebits.com/download/${version}";
       sha256 = "d1b7b93f1814635acdb3e256b3099af71a12bfc88b48ebc293aa3c3917b9fc2f";
    };
    description = "Go ahead. Forget your passwords.";
    homepage = "https://1password.com";
  };

  Spectacle = self.installApplication rec {
    name = "Spectacle";
    version = "1.2";
    sourceRoot = "Spectacle.app";
    src = super.fetchurl {
      url = "https://s3.amazonaws.com/spectacle/downloads/Spectacle+${version}.zip";
      sha256 = "037kayakprzvs27b50r260lwh2r9479f2pd221qmdv04nkrmnvbn";
    };
    description = "Move and resize windows with ease.";
    homepage = "https://www.spectacleapp.com";
  };
}
