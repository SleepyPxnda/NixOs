{ self, ... }:
let
  inherit
    (self.inputs)
    nixpkgs
    nixpkgs-unstable
    nixos-hardware
    hyprland
    ;
  nixosSystem = nixpkgs.lib.makeOverridable nixpkgs.lib.nixosSystem;
  overlay-unstable = final: prev: {
    unstable = import nixpkgs-unstable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };

  customModules = import ./core/default.nix;
  baseModules = [
    # make flake inputs accessible in NixOS
    {
      _module.args.self = self;
      _module.args.inputs = self.inputs;
    }
    {
      imports = [
        ({ pkgs, ... }: {
          nixpkgs.overlays = [
            overlay-unstable
            (import ../pkgs)
          ];
          nix.nixPath = [
            "nixpkgs=${pkgs.path}"
          ];
          documentation.info.enable = false;
        })
        hyprland.nixosModules.default
      ];
    }
    ../modules
    # ../profiles
  ];
  defaultModules = baseModules ++ customModules;
in
{
  flake.nixosConfigurations = {
    # use your hardware- model from this list: https://github.com/NixOS/nixos-hardware/blob/master/flake.nix
    jupiter = nixosSystem {
      system = "x86_64-linux";
      modules = defaultModules ++ [
        # nixos-hardware.nixosModules.bmax-b7-power
        ./jupiter/configuration.nix
      ];
    };
    mibook = nixosSystem {
      system = "x86_64-linux";
      modules = defaultModules ++ [
        # nixos-hardware.nixosModules.mibook
        ./mibook/configuration.nix
      ];
    };
  };
}