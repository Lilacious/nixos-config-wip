{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "catppuccin-btop";
  version = "2024-05-14";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "btop";
    rev = "21b8d5956a8b07fa52519e3267fb3a2d2e693d17";
    hash = "sha256-UXeTypc15MhjgGUiCrDUZ40m32yH2o1N+rcrEgY6sME==";
  };

  installPhase = ''
    runHook preInstall

    mkdir -pv $out/share/btop/themes/
    cp -rv themes/* $out/share/btop/themes/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel themes for btop";
    homepage = "https://github.com/catppuccin/btop";
    license = licenses.mit;
    maintainers = with maintainers; [ lilacious ];
    platforms = platforms.all;
  };
}
