{ lib, ... }:
with lib;
{
  options.myModules = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = lib.mdDoc ''
        Disables my modules entirely if disabled.
      '';
    };
  };

  imports = [
    ./desktop
    ./other
    ./programs
    ./services
  ];
}
