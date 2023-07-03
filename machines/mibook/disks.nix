{ config, lib, pkgs, ... }:

#TODO: CHECK THIS OUT: https://github.com/nix-community/disko its kinda better but felix does not support it 

{
    fileSystems."/" =
    { device = "/dev/disk/by-uuid/077abdb0-cbc1-4589-b411-25ecc157488f";
      fsType = "ext4";
    };
}
