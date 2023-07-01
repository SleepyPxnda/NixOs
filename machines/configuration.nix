{ self, ... }:
let
  inherit
    (self.inputs)
    nixpkgs
    nixpkgs-unstable
    nixos-hardware
    ;
  nixosSystem = nixpkgs.lib.makeOverridable nixpkgs.lib.nixosSystem;
  overlay-unstable = final: prev: {
    unstable = import nixpkgs-unstable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
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
  };
}