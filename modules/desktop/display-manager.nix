{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.myModules.desktop;
in
{
  config = mkIf cfg.enable {
    services = {
      /*
      xserver = {
        enable = true;
        displayManager = {
          gdm.enable = mkDefault true;
        };
      };
      */
      # displayManager.defaultSession = "gnome";
      displayManager = {
        enable = true;
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };
    };
  };
}
