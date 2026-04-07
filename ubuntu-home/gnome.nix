{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.paperwm
    gnomeExtensions.hide-top-bar
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "paperwm@paperwm.github.com"
        "hide-top-bar@tuxor1337"
      ];
    };

    "org/gnome/desktop/interface" = {
      gtk-theme = "Yaru-blue-dark";
      icon-theme = "Yaru-blue";
      color-scheme = "prefer-dark";
      accent-color = "#87CEEB";
      cursor-theme = "Adwaita";
      font-name = "Adwaita Sans 11";
      monospace-font-name = "Adwaita Mono 11";
      document-font-name = "Adwaita Sans 12";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
    };

    "org/gnome/desktop/wm/preferences" = {
      theme = "Adwaita";
      titlebar-font = "Adwaita Sans Bold 11";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/bryce/.config/home-manager/backgrounds/digital-art-style-river-nature-landscape.jpg";
      picture-uri-dark = "file:///home/bryce/.config/home-manager/backgrounds/digital-art-style-river-nature-landscape.jpg";
      picture-options = "zoom";
      primary-color = "#023c88";
      secondary-color = "#5789ca";
      color-shading-type = "solid";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.0;
      transparency-mode = "FIXED";
    };
  };
}
