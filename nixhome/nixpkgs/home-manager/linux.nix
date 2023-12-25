{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./modules/home.nix
    ./modules/packages.nix
  ];

  home.homeDirectory = "/home/yogesh";
  home.username = "yogesh";

  home.stateVersion = "23.11";

  fonts.fontconfig.enable = true;

  programs.tmux.enable = false;
}
