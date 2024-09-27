{
  imports = [
    ./common.nix
    ../users/wsl
  ];

  wsl = {
    enable = true;
    defaultUser = "nixos";
  };
}
