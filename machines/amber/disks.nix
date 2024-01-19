{ config, lib, pkgs, ... }:

#TODO: CHECK THIS OUT: https://github.com/nix-community/disko its kinda better but felix does not support it 

{
   fileSystems."/" =
    { device = "/dev/disk/by-uuid/c95c64ad-f131-4bde-9bca-a7a3692173da";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0D77-17BB";
      fsType = "vfat";
    };
}
