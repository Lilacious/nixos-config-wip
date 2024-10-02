{
  inputs,
  ...
}:
{
  imports = [
    ./nixos.nix
    ../modules
    ../secrets

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        extraSpecialArgs = {
          inherit inputs;
        };
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    }

    ../users/yunix
  ];

  myModules.programs.desktop.enable = true;
}
