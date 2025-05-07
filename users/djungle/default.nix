{
  pkgs,
  ...
}:
{
  imports = [
    ../common
  ];

  modules = {
    dev.languages = {
      kotlin.enable = true;
      latex.enable = true;
      c-cpp.enable = true;
    };

    media.sioyek.enable = true;
  };

  home.packages = with pkgs; [
    keepassxc
    mpv
    lazygit
    nwg-displays
  ];

  home.username = "djungle";
  home.homeDirectory = "/home/djungle";

  programs.home-manager.enable = true;

  home.stateVersion = "24.11"; # Current version of NixOS
}
