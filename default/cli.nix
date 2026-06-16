{ config, pkgs, lib, ... }:

{
  home = {
    shellAliases = {
      hs = "home-manager switch";
      ll = "ls -l";
    };
    packages = with pkgs; [
      bat
      curl
      lazygit
      nodejs
      oh-my-zsh
      ripgrep
      wget
    ];
  };
}
