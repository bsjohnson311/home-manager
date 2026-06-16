{ config, pkgs, lib, ... }:

{
  home.username = "bryce";
  home.homeDirectory = "/home/bryce";

  home.stateVersion = "25.11"; 

  targets.genericLinux.gpu.nvidia = {
    enable = true;
    version = "580.142";
    sha256 = "sha256-IJFfzz/+icNVDPk7YKBKKFRTFQ2S4kaOGRGkNiBEdWM=";
  };

  news.display = "silent";

  imports = [
    ./git.nix
    ./ssh.nix
    ./claude-code.nix
    ./gnome.nix
  ];
}
