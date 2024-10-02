{
  lib,
  ...
}:
with lib;
{
  imports = [
    ./alias.nix
    ./locale.nix
    ./nix.nix
    ./packages.nix
    ./zsh.nix
  ];

  networking.firewall.enable = mkForce true;
  time.timeZone = mkDefault "Europe/Berlin";
  hardware.enableRedistributableFirmware = mkDefault true;
  nixpkgs.config.allowUnfree = mkDefault true;
}
