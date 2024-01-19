{ config, pkgs, lib, ... }:
{
  imports = [

    ./disks.nix
    ./hardware-configuration.nix
    ./environments.nix
    ./system.nix # use docker here
  ];

  networking.hostName = "amber";
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.unstable.linuxPackages_latest;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # services.xserver.enable = true;
  # services.xserver.displayManager.sddm.enable = tru;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;

  system = {
    stateVersion = "23.11";
    autoUpgrade.enable = true;
  };
}
