{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    settings.user.name = "bryce";
    settings.user.email = "bsjohnson311@gmail.com";
    settings.push.autoSetupRemote = true;
  };
}
