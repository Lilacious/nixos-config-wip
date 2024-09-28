{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.myModules.programs.gaming;
in
{
  options = {
    myModules.programs.gaming = {
      enable = mkEnableOption "gaming applications";

      emulators.enable = mkEnableOption "emulators" // {
        default = true;
      };
      steam.enable = mkEnableOption "steam client" // {
        default = true;
      };
      heroic.enable = mkEnableOption "heroic game launcher" // {
        default = true;
      };
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages =
      with pkgs;
      mkIf cfg.emulators.enable [
        melonDS # DS Emulator
        lime3ds # 3DS Emulator
      ]
      ++ mkIf cfg.heroic.enable [
        heroic
      ];

    programs.steam.enable = cfg.steam.enable;
  };
}
