{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ## IDE
    # jetbrains.idea-ultimate

    ## PDF viewer
    zathura

    ## Flash card
    anki

    ## Other
    edid-decode # decode display edid to readable info
    # gparted # parted with ui
    wireguard-tools
    # texlive.combined.scheme-basic
    texlive.combined.scheme-full
    openconnect # VPN Client for Cisco's AnyConnect SSL VPN

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
  ];
}
