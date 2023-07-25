{ config, lib, pkgs, ... }:
let
  cfg = config.my.hardware.wifi;
in
{
  options.my.hardware.wifi = with lib; {
    enable = mkEnableOption "wifi configuration";
  };

  config = lib.mkIf cfg.enable {
    hardware.wifi = {
      enable = true;
      package = pkgs.rtw89-firmware;
    };
  };
}