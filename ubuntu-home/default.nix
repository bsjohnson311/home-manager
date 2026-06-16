{ config, pkgs, lib, ... }:

{
  home.username = "bryce";
  home.homeDirectory = "/home/bryce";

  home.stateVersion = "25.11"; 

  targets.genericLinux.gpu = {
    # Must be enabled explicitly: gpu.enable defaults to
    # targets.genericLinux.enable (false here), which left the whole nvidia
    # block inert and /run/opengl-driver pointing at a Mesa-only env, crashing
    # nix-built sway on the Nvidia GPU.
    enable = true;
    nvidia = {
      enable = true;
      version = "580.142";
      sha256 = "sha256-IJFfzz/+icNVDPk7YKBKKFRTFQ2S4kaOGRGkNiBEdWM=";
    };
  };

  news.display = "silent";

  imports = [
    ./git.nix
    ./ssh.nix
    ./claude-code.nix
    ./gnome.nix
  ];
}
