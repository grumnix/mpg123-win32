{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-24.05";

    tinycmmc.url = "github:grumbel/tinycmmc";
    tinycmmc.inputs.nixpkgs.follows = "nixpkgs";

    mpg123_src.url = "https://downloads.sourceforge.net/project/mpg123/mpg123/1.31.3/mpg123-1.31.3.tar.bz2";
    mpg123_src.flake = false;
  };

  outputs = { self, nixpkgs, tinycmmc, mpg123_src }:
    tinycmmc.lib.eachWin32SystemWithPkgs (pkgs:
      {
        packages = rec {
          default = mpg123;

          mpg123 = pkgs.stdenv.mkDerivation {
            pname = "mpg123";
            version = "1.31.3";

            src = mpg123_src;
          };
        };
      }
    );
}
