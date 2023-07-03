{ config, lib, pkgs, ... }:

#TODO: CHECK THIS OUT: https://github.com/nix-community/disko its kinda better but felix does not support it 

{
    fileSystems."/" =
    { device = "/dev/disk/by-uuid/5c778ca7-57fb-44be-ac8c-ae5d2486b7ad";
      fsType = "ext4";
    };
}