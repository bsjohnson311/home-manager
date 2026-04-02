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
    ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        command = "zsh";
      };
    };
    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      sensibleOnTop = false;
      extraConfig = ''
        set -gu default-command ${pkgs.zsh}/bin/zsh
        set -g mouse on
        set -g status-fg white
        set -g status-bg black
      '';
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };

  home.file.".config/nvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/bsjohnson311/starter.git";
      ref = "main";
      rev = "949bd3846742a6f12f77915b9f1de51eadb4f8bd";
    };
    force = true;
    recursive = true;
  };
}

