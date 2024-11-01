{
  inputs,
  pkgs,
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

  environment.systemPackages = with pkgs; [
    ## Development
    (python3.withPackages (
      ps: with ps; [
        beautifulsoup4
        matplotlib
        numpy
        pycodestyle
        sympy
        requests
        tkinter
      ]
    ))
    gcc
    # texlive.combined.scheme-basic
    texlive.combined.scheme-full
  ];

  myModules = {
    programs = {
      vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          ms-python.python
          rust-lang.rust-analyzer
          tamasfe.even-better-toml
          james-yu.latex-workshop
        ];
      };
    };
  };
}
