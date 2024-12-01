{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.myModules.other.fonts;
in
{
  options = with types; {
    myModules.other.fonts = {
      enable = mkEnableOption "default fonts";
    };
  };

  config = mkIf cfg.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        noto-fonts-cjk-serif
        noto-fonts-cjk-sans
        nerd-fonts.agave
        nerd-fonts.arimo
        nerd-fonts.fira-code
        nerd-fonts.inconsolata
      ];

      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [
            "Agave Nerd Font"
            "FiraCode Nerd Font"
            "DejaVu Serif"
            "Noto Serif CJK JP"
            "Noto Serif CJK SC"
            "Noto Serif CJK TC"
            "Noto Serif CJK KR"
          ];
          emoji = [
            "Noto Color Emoji"
          ];
          sansSerif = [
            "Arimo Nerd Font"
            "DejaVu Sans"
            "Noto Sans CJK JP"
            "Noto Sans CJK SC"
            "Noto Sans CJK TC"
            "Noto Sans CJK KR"
          ];
          monospace = [
            "Inconsolata Nerd Font"
            "DejaVu Sans Mono"
          ];
        };
      };
    };
  };
}
