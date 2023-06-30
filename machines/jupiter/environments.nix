# enabled profiles
{ config, lib, ... }:
let
  secrets = config.sops.secrets;
in
{
  my.profiles = {
    hyprland.enable = true;
    zsh.enable = true;
    apps = {
      desktop_apps = true;
      dev_apps = true;
    };
  };
}