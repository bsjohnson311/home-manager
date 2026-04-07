{ config, pkgs, lib, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  home = {
    shellAliases = {
      olc = "ollama launch claude";
    };
  };
}
