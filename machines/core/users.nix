{ config, pkgs, lib, ... }:
{

  users.users.finn = {
    isNormalUser = true;
    home = "/home/finn";
    group = "finn";
    extraGroups = [
      "adbusers" # adb control
      "audio" # sound control
      "dialout" # serial-console
      "docker" # usage of `docker` socket
      "input" # mouse control
      "libvirtd" # kvm control
      "networkmanager" # wireless configuration
      "podman" # usage of `podman` socket
      "video" # screen control
      "wheel" # `sudo` for the user.
    ];

    # openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOFx6OLwL9MbkD3mnMsv+xrzZHN/rwCTgVs758SCLG0h finn@thinkman" ];
  };

  users.groups.finn = {
    gid = 1000;
  };
}