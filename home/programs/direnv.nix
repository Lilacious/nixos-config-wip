{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.myHome.programs.direnv;
in
{
  options = {
    myHome.programs.direnv = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
