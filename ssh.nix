{ config, pkgs, lib, ... }:

{
# SSH config
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

# SSH agent
  services.ssh-agent = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
