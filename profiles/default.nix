{
  flake.nixosModules = {
    server = ./server.nix;
    workstation = import ./workstation.nix;
  };
}
