{ config, pkgs, lib, ... }:
{
  # Packages
  environment.systemPackages = with pkgs; [
    bandwhich
    bind # dig
    borgbackup
    cryptsetup
    file
    fzf
    gettext
    git
    gitAndTools.delta
    gnufdisk
    gptfdisk
    htop
    jq
    killall
    lsof
    mosh
    multipath-tools # kpartx
    mtr
    nmap
    nmon
    ouch # de-/compress
    pciutils
    progress
    pv
    reptyr
    rsync
    screen
    stress-ng
    usbutils
    tmux
    vim
    wget
    whois
    zip
    unzip
    networkmanager
  ];

  time.timeZone = "Europe/Berlin";
  services.timesyncd.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

}