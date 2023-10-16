{ config, lib, pkgs, ... }:
let
  cfg = config.my.profiles.hyprland;
 in {
  options.my.profiles.hyprland = with lib; {
    enable = mkEnableOption "hyprland env";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      nvidiaPatches = true;
      xwayland.enable = true;
    };
    users.users.finn.packages = with pkgs; [
      wofi
      mako
      kitty
      hyprpaper
      waybar
      libsForQt5.dolphin
      #libsForQt5.systemsettings
      libsForQt5.polkit-kde-agent
      #xdg-desktop-portal-hyprland
    ];
    hardware = {
    # Opengl
    opengl.enable = true;

    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
    };   
  };

}
