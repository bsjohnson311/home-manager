{ config, pkgs, lib, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        user = "bsjohnson311";
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}

