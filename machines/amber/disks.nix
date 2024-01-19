{ config, lib, pkgs, ... }:

#TODO: CHECK THIS OUT: https://github.com/nix-community/disko its kinda better but felix does not support it

{
   fileSystems."/" =
    { device = "/dev/disk/by-uuid/a2a4e079-0992-48e5-bdaa-6f2411d61c73";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/AFDE-9DB5";
      fsType = "vfat";
    };

 swapDevices =
  [ { device = "/dev/disk/by-uuid/16dd4e10-496d-46fd-83bf-d801c0fffc7e"; } ];
}
