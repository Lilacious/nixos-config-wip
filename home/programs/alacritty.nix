{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.myHome.programs.alacritty;

  normalFontFamily = "Agave Nerd Font";
  boldFontFamily = "Agave Nerd Font";
  italicFontFamily = "Agave Nerd Font";
  boldItalicFontFamily = "Agave Nerd Font";
  fontSize = 12;
in
{
  options = {
    myHome.programs.alacritty = {
      enable = mkEnableOption "alacritty";
    };
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
        window = {
          dimensions = {
            columns = 0;
            lines = 0;
          };
          padding = {
            x = 5;
            y = 5;
          };
          dynamic_padding = false;
          decorations = "full";
          opacity = 1.0;
          startup_mode = "Windowed";
          title = "Alacritty";
          dynamic_title = true;
          class = {
            instance = "Alacritty";
            general = "Alacritty";
          };
          decorations_theme_variant = "Dark";
          resize_increments = false;
        };
        scrolling = {
          history = 10000;
          multiplier = 3;
        };
        font = {
          normal = {
            family = "${normalFontFamily}";
            style = "Regular";
          };
          bold = {
            family = "${boldFontFamily}";
            style = "Bold";
          };
          italic = {
            family = "${italicFontFamily}";
            style = "Italic";
          };
          bold_italic = {
            family = "${boldItalicFontFamily}";
            style = "Bold Italic";
          };
          size = fontSize;
          offset = {
            x = 0;
            y = 0;
          };
          glyph_offset = {
            x = 0;
            y = 0;
          };
          builtin_box_drawing = true;
        };
        colors = {
          primary = {
            background = "#1E1E2E";
            foreground = "#CDD6F4";
            dim_foreground = "#CDD6F4";
            bright_foreground = "#CDD6F4";
          };
          cursor = {
            text = "#1E1E2E";
            cursor = "#F5E0DC";
          };
          vi_mode_cursor = {
            text = "#1E1E2E";
            cursor = "#B4BEFE";
          };
          search = {
            matches = {
              foreground = "#1E1E2E";
              background = "#A6ADC8";
            };
            focused_match = {
              foreground = "#1E1E2E";
              background = "#A6E3A1";
            };
          };
          hints = {
            start = {
              foreground = "#1E1E2E";
              background = "#F9E2AF";
            };
            end = {
              foreground = "#1E1E2E";
              background = "#A6ADC8";
            };
          };
          line_indicator = {
            foreground = "None";
            background = "None";
          };
          footer_bar = {
            background = "#1E1E2E";
            foreground = "#A6ADC8";
          };
          selection = {
            text = "#1E1E2E";
            background = "#F5E0DC";
          };
          normal = {
            black = "#45475A"; # surface1
            red = "#F38BA8"; # red
            green = "#A6E3A1"; # green
            yellow = "#F9E2AF"; # yellow
            blue = "#89B4FA"; # blue
            magenta = "#F5C2E7"; # pink
            cyan = "#94E2D5"; # teal
            white = "#BAC2DE"; # subtext1
          };
          bright = {
            black = "#585B70"; # surface2
            red = "#F38BA8"; # red
            green = "#A6E3A1"; # green
            yellow = "#F9E2AF"; # yellow
            blue = "#89B4FA"; # blue
            magenta = "#F5C2E7"; # pink
            cyan = "#94E2D5"; # teal
            white = "#A6ADC8"; # subtext0
          };
          dim = {
            black = "#45475A"; # surface1
            red = "#F38BA8"; # red
            green = "#A6E3A1"; # green
            yellow = "#F9E2AF"; # yellow
            blue = "#89B4FA"; # blue
            magenta = "#F5C2E7"; # pink
            cyan = "#94E2D5"; # teal
            white = "#BAC2DE"; # subtext1
          };
          indexed_colors = [
            {
              index = 16;
              color = "#FAB387";
            }
            {
              index = 17;
              color = "#F5E0DC";
            }
          ];
          transparent_background_colors = false;
        };
        selection = {
          save_to_clipboard = true;
        };
        cursor = {
          style = {
            shape = "Block";
            blinking = "On";
          };
          blink_timeout = 0;
          unfocused_hollow = true;
        };
        general.live_config_reload = false;
      };
    };
  };
}
