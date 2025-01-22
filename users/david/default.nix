{ ... }:
{
  imports = [
    ../common
    ./secrets
  ];

  modules = {
    dev.languages = {
      kotlin.enable = true;
    };
  };

  home.username = "david";
  home.homeDirectory = "/home/david";

  programs.home-manager.enable = true;

  home.stateVersion = "24.11"; # Current version of NixOS
}
