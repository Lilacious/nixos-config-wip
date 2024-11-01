{ pkgs, ... }:
{
  system.stateVersion = "22.05";
  networking.hostName = "penelope";

  ## Grub bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };
  ## Enable networking
  networking.networkmanager.enable = true;
  # Fix wg-quick issues
  services.resolved.enable = true;

  ## Bluetooth
  hardware.bluetooth.enable = true;

  myModules = {
    desktop = {
      gnome.enable = true;
      plasma.enable = false;
    };

    services = {
      printing.enable = true;
    };

    programs = {
      virt-manager.enable = true;
      vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          james-yu.latex-workshop
          ms-python.python
        ];
      };
    };
  };
}
