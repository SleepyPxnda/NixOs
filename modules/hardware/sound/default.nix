{ config, lib, pkgs, ... }:
let
  cfg = config.my.hardware.bluetooth;
in
{
  options.my.hardware.sound = with lib; {
    enable = mkEnableOption "Sound configuration";
  };

  config = lib.mkIf cfg.enable {
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;
    users.extraUsers.finn.extraGroups = [ "audio" ];
  };
}