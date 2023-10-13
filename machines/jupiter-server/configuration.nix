{ config, pkgs, lib, ... }:
{
  imports = [

    ./disks.nix
    ./hardware-configuration.nix
    ./environments.nix
  ];

  networking.hostName = "jupiter-server";
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.unstable.linuxPackages_latest;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  system = {
    stateVersion = "23.05";
    autoUpgrade.enable = true;
  };
}
