{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ### Network
    wget
    curl

    ### System
    pciutils
    usbutils
    dmidecode
    lm_sensors

    ### Hard drive monitoring
    smartmontools

    ### Tops
    htop
    btop
    powertop

    ### Files
    zip
    unzip

    ### Core utils
    ## find
    fd # Simple find command
    fzf # A command-line fuzzy finder

    ## du/df
    ncdu # Disk usage analyzer ncurses
    # du-dust     # Disk usage analizer in rust
    duf # Disk Usage/Free Utility
    ## grep
    ripgrep # Better grep for code search
    ## cat
    # lolcat      # A rainbow version of cat
    # bat # Better cat with syntax highlighting
    ## ls/tree
    eza # ls & tree replacement

    ## Nix
    comma # runs software without installing
    nixfmt-rfc-style # nix formating
    deadnix # Find and remove unused code in nix files
    statix # Lints and suggestions for nix-lang
    nixpkgs-review # review nixpkgs pr
    nix-init # package generation

    ## Other
    fastfetch # Sys info fetcher
    cheat # cheat sheet
    git
  ];
}
