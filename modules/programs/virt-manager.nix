# For home config see nix-config/home/programs/virt-manager.nix
{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.myModules.programs.virt-manager;
in
{
  options = {
    myModules.programs.virt-manager = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
      enableOSX = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
  config = mkIf cfg.enable (mkMerge [
    {
      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;
    }
    (mkIf cfg.enableOSX {
      boot.extraModprobeConfig = ''
        options kvm_intel nested=1
        options kvm_intel emulate_invalid_guest_state=0
        options kvm ignore_msrs=1
      '';
    })
  ]);
}
