{ config, pkgs, lib, ... }:
{
  imports = [

    ./disks.nix
    ./hardware-configuration.nix
    ./environments.nix
    # ./system.nix use docker here
  ];

  networking.hostName = "mibook";
  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
  };


  system = {
    stateVersion = "23.05";
    autoUpgrade.enable = true;
  };
}