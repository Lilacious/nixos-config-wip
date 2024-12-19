{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  users.users.yunix = {
    isNormalUser = true;
    home = if pkgs.stdenv.isDarwin then "/Users/yunix" else "/home/yunix";
    description = "Yunix";
    extraGroups = mkIf pkgs.stdenv.isLinux [
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
    ];
    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = [
      ## penelope
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGc5xk4R+2CfNV1fyyvZEZgzjaRomO0hCJ55E00pSOsv"
      ## kalypso
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILGVWA+PLmapB6pW+kovWMyShlKEXI7XPemWI8i3GlSY"
    ];
  };

  home-manager.users.yunix = {
    home = {
      username = "yunix";
      homeDirectory = "${config.users.users.yunix.home}";
      stateVersion = "23.05";
    };
    imports = [
      ./git.nix
      ../../home
    ];
  };
}
