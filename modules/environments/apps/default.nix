
{ config, lib, pkgs, ... }:
let
  cfg = config.my.profiles.apps;
 in {



  options.my.profiles.apps = with lib; {
    desktop_apps = mkEnableOption "Basic Apps";
    dev_apps = mkEnableOption "Development Apps";
  };

  config = lib.mkIf cfg.desktop_apps {
    users.users.finn.packages = with pkgs; [
        firefox
        thunderbird
	    google-chrome
	    discord
	    spotify
	    keepassxc
	    nextcloud-client
	    neovim
    ] ++ lib.optionals cf.dev_apps [
        vscode
        jetbrains.webstorm
        jetbrains.goland
        jetbrains.pycharm-professional
        jetbrains.idea-ultimate
      ];
    };    
  }