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
      waybar
    ];
    hardware = {
    # Opengl
    opengl.enable = true;

    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
    };   
  };

}