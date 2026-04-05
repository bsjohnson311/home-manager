{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.paperwm
    gnomeExtensions.hide-top-bar
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ 
        "blur-my-shell@aunetx"
        "paperwm@paperwm.github.com"
        "hide-top-bar@tuxor1337"
      ];
    };
  };
}
