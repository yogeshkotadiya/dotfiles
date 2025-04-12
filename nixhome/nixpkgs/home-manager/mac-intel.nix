{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./modules/home.nix
    ./modules/packages.nix
  ];

  home.homeDirectory = "/Users/yogesh";
  home.username = "yogesh";

  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;

  programs.tmux.enable = false;
}
