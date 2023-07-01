{
  description = "NixOS configuration";

  inputs = {
    nix.url = "github:NixOS/nix";
    nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    }

  outputs = inputs@{ self, flake-parts, deploy-rs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      imports = [
        ./machines/configurations.nix
      ];
      systems = [ "x86_64-linux" "aarch64-linux" ];
    };
  };
}