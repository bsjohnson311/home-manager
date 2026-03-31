{ config, pkgs, lib, ... }:

{
  home = {
    shellAliases = {
      hs = "home-manager switch";
      ll = "ls -l";
    };
    packages = with pkgs; [
      oh-my-zsh
      bat
      lazygit
      ripgrep
    ];
  };
}
