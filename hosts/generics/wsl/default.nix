{ inputs, ... }:
let
  inherit (inputs.nixpkgs) lib;
  arch = "x86_64-linux";
in
{
  flake.nixosConfigurations = {
    wsl = lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        system = arch;
      };
      modules = [
        ../../../profiles/wsl.nix

        inputs.nixos-wsl.nixosModules.default
        {
          networking.hostName = "wsl";
          nixpkgs.hostPlatform = arch;
          system.stateVersion = "24.05";
          myModules.nixvim.languages = {
            python = true;
            php = true;
            sql = true;
          };
        }
      ];
    };
  };
}
