{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.paperwm
    gnomeExtensions.hide-top-bar
    gnomeExtensions.search-light
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ 
        "blur-my-shell@aunetx"
        "paperwm@paperwm.github.com"
        "hide-top-bar@tuxor1337"
        "search-light@icedman"
      ];
    };
  };
}
