{ config, lib, pkgs, ... }:
let
  cfg = config.my.profiles.zsh;
 in {



  options.my.profiles.zsh = with lib; {
    enable = mkEnableOption "zsh env";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
    programs.zsh.ohMyZsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
    } ;  


}