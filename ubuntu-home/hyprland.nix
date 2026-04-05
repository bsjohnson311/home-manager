{ config, pkgs, lib, ... }:

{
  programs.kitty.enable = true; 
  wayland.windowManager.hyprland.enable = true; # enable Hyprland
}

