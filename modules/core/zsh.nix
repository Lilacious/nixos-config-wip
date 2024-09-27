# For home config see home/core/zsh.nix
{
  ## For programs.zsh.enableCompletion
  environment.pathsToLink = [ "/share/zsh" ];
  ## Enable zsh system-wide
  programs.zsh.enable = true;
}
