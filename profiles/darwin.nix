{
  inputs,
  ...
}:
{
  imports = [
    ./common.nix
    ../modules/vim
    inputs.nixvim.nixDarwinModules.nixvim
  ];
}
