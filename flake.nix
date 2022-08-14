{
  description = "ahwang16.github.io";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        jekyll_env = pkgs.bundlerEnv {
          name = "jekyll_env";
          ruby = pkgs.ruby;
          gemdir = ./.;
        };
      in rec {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ bundler ruby jekyll_env ];
        };
        defaultPackage = pkgs.stdenv.mkDerivation {
          version = "0.0.0";
          name = "ahwang16.github.io";
          src = ./.;
          buildInputs = with pkgs; [ jekyll_env bundler ruby ];
          buildPhase = ''
            cd $src
            mkdir -p $out
            jekyll build --destination $out --disable-disk-cache
          '';
          phases = [ "buildPhase" ];
        };
        formatter = nixpkgs.legacyPackages."${system}".nixfmt;
      });
}
