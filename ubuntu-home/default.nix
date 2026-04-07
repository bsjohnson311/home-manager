{ config, pkgs, lib, ... }:

{
  home.username = "bryce";
  home.homeDirectory = "/home/bryce";

  home.stateVersion = "25.11"; 

  targets.genericLinux.gpu.enable = true;

  news.display = "silent";

  imports = [
    ./git.nix
    ./ssh.nix
    ./ollama.nix
    ./claude-code.nix
    ./gnome.nix
  ];
}
