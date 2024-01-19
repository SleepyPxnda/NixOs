# Docker related settings
{ config, inputs, lib, options, pkgs, ... }:
let
  cfg = config.my.profiles.docker;
in
{
  options.my.profiles.docker = with lib; {
    enable = mkEnableOption "docker configuration";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      docker
      docker-compose
    ];

    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };
  };
}
