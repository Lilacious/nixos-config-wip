{
  inputs,
  ...
}:
{
  imports = [
    ../modules/core
    ../modules/core/vim
    inputs.nixvim.nixDarwinModules.nixvim
  ];
}
