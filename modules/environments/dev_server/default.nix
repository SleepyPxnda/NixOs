{ config, lib, pkgs, ... }:
let
  cfg = config.my.profiles.dev_server;
 in {
  options.my.profiles.dev_server = with lib; {
    enable = mkEnableOption "Development Server environment";
  };

  config = lib.mkIf cfg.enable {
    programs.dev_server = {
      enable = true;
      nvidiaPatches = true;
      xwayland.enable = true;
    };
    users.users.finn.packages = with pkgs; [
      # Software
    ];
  };

}
