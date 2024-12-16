# For system config see nix-config/modules/desktop/plasma.nix
{
  inputs,
  config,
  osConfig,
  lib,
  ...
}:
with lib;
let
  cfg = config.myHome.desktop.plasma;
  osCfg = osConfig.myModules.desktop.plasma;
in
{
  options = {
    myHome.desktop.plasma = {
      enable = mkOption {
        type = types.bool;
        default = osCfg.enable;
      };
    };
  };

  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  config = mkIf cfg.enable {
    programs = {
      plasma = {
        enable = true;

        workspace = {
          clickItemTo = "select";
        };

        shortcuts = {
          "Alacritty.desktop" = {
            "_launch" = "Meta+Return";
          };
          "firefox.desktop" = {
            "_launch" = "Meta+B"; # Browser
          };
          "org.kde.dolphin.desktop" = {
            "_launch" = "Meta+E"; # Explorer
          };
          "kwin" = {
            "Window Close" = [
              "Meta+Q"
              "Alt+F4"
            ];
            "Window Maximize" = "Meta+M";
            "Window Fullscreen" = "Meta+Shift+M";
          };
          "org_kde_powerdevil" = {
            "powerProfile" = [
              "Battery"
              "Meta+P"
            ];
          };
        };
      };
    };
  };
}
