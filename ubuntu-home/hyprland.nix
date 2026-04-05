{ config, pkgs, lib, ... }:

{
  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    # systemd.enable = true;
    xwayland.enable = true;

    settings = {
      # ─── Global Settings ───────────────────────────────────────────
      general = {
        gaps_in = 8;
        gaps_out = 16;
        border_size = 1;
        col.active_border = "rgba(9c9c9c99)rgba(6e6e6e99)"; # macOS-like gray gradient
        col.inactive_border = "rgba(3a3a3a99)";
        resize_on_borders = true;
        resize_border_color = "0xffff9e";
        no_border_on_floating = true;
        extend_border_grab_area = 15;
      };

      # ─── Decoration (rounded corners, shadows) ───────────────────────
      decoration = {
        rounding = 12;  # macOS-like rounded windows
        active_opacity = 1.0;
        inactive_opacity = 0.95;

        # Drop shadows like macOS
        drop_shadow = true;
        shadow_range = 20;
        shadow_render_power = 3;
        col.shadow = "rgba(00000066)";
        col.shadow_inactive = "rgba(00000033)";

        # Dimming inactive windows
        dim_inactive = true;
        dim_strength = 0.05;
      };

      # ─── Animations (smooth like macOS) ─────────────────────────────
      animations = {
        enabled = true;
        bezier = [
          "smoothOut, 0.36, 0, 0.66, -0.56, 0.045, 1, 0.22, 1"
          "smoothIn, 0.36, 0, 0.66, -0.56, 0.045, 1, 0.22, 1"
          "macOS, 0.4, 0, 0.2, 1, 0.22, 1, 0.68, 1"
        ];

        animation = [
          "windows, 1, 7, macOS, slide"
          "windowsMove, 1, 7, macOS, slide"
          "windowsOut, 1, 7, macOS, slide, over"
          "border, 1, 10, default"
          "border, 1, 10, macOS"
          "fadeIn, 1, 7, smoothIn"
          "fadeOut, 1, 7, smoothOut"
          "fadeSwitch, 1, 7, default"
          "workspace, 1, 6, macOS, slide"
        ];
      };

      # ─── Layout ─────────────────────────────────────────────────────
      layout = {
        dwindls = {
          keep_floating_around = true;
        };
      };

      # ─── Gestures ────────────────────────────────────────────────────
     gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      # ─── Input ──────────────────────────────────────────────────────
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        float_modifier = "SUPER";
        mouse_refocus = true;
        sensitivity = 0;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          tap-to-click = true;
          clickfinger_behavior = true;
        };
      };

      # ─── Miscellaneous ──────────────────────────────────────────────
      misc = {
        disable_hypr_autodetect = false;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        disable_spawn_when_not_in_browsertree = false;
        allow_session_lock = true;
      };

      # ─── Autostart ─────────────────────────────────────────────────
      autostarts = {
        # Waybar is typically launched separately via home-manager programs.waybar
      };

      # ─── Window Rules ───────────────────────────────────────────────
      windowrulev2 = [
        # Float dialogs and file pickers like macOS
        "float, class:^(org.freedesktop.impl.portal.*)$, title:^(File Picker|Color Picker|.*Open.*)$"
        "float, class:^(org.kde.dolphin)$, title:^( Dolphin)$"
        "float, class:^(nm-connection-editor)$"
        "float, class:^(blueman-manager)$"

        # Rounded corners for specific apps
        "rounded corners, class: ^(code-oss|code)$"
        "rounded corners, class: ^(kitty|Alacritty)$"
        "rounded corners, class: ^(firefox|Firefox)$"

        # Center new windows like macOS
        "center, initial:1"

        # No borders for floating windows
        "noborder, floating:1"
        "nofullscreenrequest, floating:1"
      ];

      # ─── Workspace Rules ───────────────────────────────────────────
      # (workspace rules use hyprland's workspace command in keybinds)
    };
  };

  # ─── Environment Variables ──────────────────────────────────────────
  home.sessionVariables = {
    XCURSOR_THEME = "Apple_cursor";
    XCURSOR_SIZE = "24";
    QT_QPA_PLATFORM = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = 1;
  };
}