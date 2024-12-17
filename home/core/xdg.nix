{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.myHome.programs.xdg;
  homeDir = config.home.homeDirectory;
in
{
  options = {
    myHome.programs.xdg = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };
  config = mkIf cfg.enable {
    xdg = {
      enable = true;
      configHome = "${homeDir}/.config";
      cacheHome = "${homeDir}/.cache";
      dataHome = "${homeDir}/.local/share";
      stateHome = "${homeDir}/.local/state";
    };
  };
}
