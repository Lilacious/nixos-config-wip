{
  lib,
  pkgs,
  ...
}:
with lib;
{
  environment.shellAliases = mkMerge [
    ({
      c = "clear";
      neofetch = "fastfetch";
    })
    (mkIf pkgs.stdenv.isLinux {
      update = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .#$HOST";
    })
  ];
}
