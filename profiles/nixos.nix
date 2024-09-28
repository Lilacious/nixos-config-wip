{
  inputs,
  ...
}:
{
  imports = [
    ./common.nix
    ../modules/core/vim
    inputs.nixvim.nixosModules.nixvim
  ];
}
