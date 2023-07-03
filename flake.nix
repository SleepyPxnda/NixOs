{
  description = "NixOS configuration";

  inputs = {
    nix.url = "github:NixOS/nix";
    nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    };

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      imports = [
        ./machines/configuration.nix
      ];

      perSystem = { self', inputs', config, pkgs, system, ... }: {
        # make pkgs available to all `perSystem` functions
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
        };
      };

      systems = [ "x86_64-linux" ];
    };
}