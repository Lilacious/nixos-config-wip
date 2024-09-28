{
  inputs,
  ...
}:
{
  imports = [
    ./common.nix
    ../users/wsl
    ../modules/core/vim
    inputs.nixvim.nixosModules.nixvim
  ];

  wsl = {
    enable = true;
    defaultUser = "nixos";
  };
}
