{ config, pkgs, lib, ... }:
{

  users.users.felix = {
    isNormalUser = true;
    home = "/home/felix";
    group = "felix";
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

  users.groups.felix = {
    gid = 1000;
  };
}