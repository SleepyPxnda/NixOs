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
        inputs.pre-commit-hooks-nix.flakeModule
      ];
}