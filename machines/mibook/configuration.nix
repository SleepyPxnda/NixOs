{ config, pkgs, lib, ... }:
{
  imports = [

    ./disks.nix
    ./hardware-configuration.nix
    ./environments.nix
    # ./system.nix use docker here
  ];

  networking.hostName = "mibook";


  system = {
    stateVersion = "23.05";
    autoUpgrade.enable = true;
  };
}