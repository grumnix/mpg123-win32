{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";

    tinycmmc.url = "github:grumbel/tinycmmc";
    tinycmmc.inputs.nixpkgs.follows = "nixpkgs";
    tinycmmc.inputs.flake-utils.follows = "flake-utils";

    mpg123_src.url = "https://downloads.sourceforge.net/project/mpg123/mpg123/1.30.2/mpg123-1.30.2.tar.bz2";
    mpg123_src.flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, tinycmmc, mpg123_src }:
    tinycmmc.lib.eachWin32SystemWithPkgs (pkgs:
      {
        packages = rec {
          default = mpg123;

          mpg123 = pkgs.stdenv.mkDerivation {
            pname = "mpg123";
            version = "1.30.2";

            src = mpg123_src;
          };
        };
      }
    );
}
