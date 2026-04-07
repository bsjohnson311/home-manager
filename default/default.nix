{ config, pkgs, lib, ... }:

{
  programs = {
    home-manager.enable = true;
    bash.enable = true;
    zsh = {
      enable = true;
      shellAliases = config.home.shellAliases;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "ys";
      };
    };
  };

  imports = [
    ./cli.nix
    ./programs.nix
  ];
}

