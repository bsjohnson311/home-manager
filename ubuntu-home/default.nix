{ config, pkgs, lib, ... }:

{
  home.username = "bryce";
  home.homeDirectory = "/home/bryce";

  home.stateVersion = "25.11"; 

  targets.genericLinux.gpu.nvidia = {
    enable = true;
    version = "580.126.09";
    sha256 = "sha256-TKxT5I+K3/Zh1HyHiO0kBZokjJ/YCYzq/QiKSYmG7CY=";
  };

  news.display = "silent";

  imports = [
    ./git.nix
    ./ssh.nix
    ./ollama.nix
    ./claude-code.nix
    ./gnome.nix
  ];
}
