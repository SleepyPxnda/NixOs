{ config, lib, pkgs, ... }:

#TODO: CHECK THIS OUT: https://github.com/nix-community/disko its kinda better but felix does not support it 

{
   fileSystems."/" =
    { device = "/dev/disk/by-uuid/f4901cbb-db30-4f14-8d8e-9dbb55aaf098";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1121-FAE5";
      fsType = "vfat";
    };
}
