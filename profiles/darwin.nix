{
  inputs,
  ...
}:
{
  imports = [
    ./common.nix
    ../modules/core/vim
    inputs.nixvim.nixDarwinModules.nixvim
  ];
}
