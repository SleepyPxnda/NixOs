# enabled profiles
{ config, lib, ... }:
let
  secrets = config.sops.secrets;
in
{
  my.profiles = {
    hyprland.enable = false;
    zsh.enable = true;
    apps = {
      desktop_apps = false;
      dev_apps = true;
      gnome_apps = false;
    };
  };

  my.hardware = {
    bluetooth.enable = true;
  };
}