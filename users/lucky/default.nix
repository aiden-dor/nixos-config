{ ... }:
{
  imports = [
    ../common
 
  ];

  modules = {
    dev.languages = {
      latex.enable = true;
      python.enable = true;
      c-cpp.enable = true;
      kotlin.enable = true;
    };

    office = {
      zoom.enable = true;
      libre.enable = true;
    };

    media.sioyek.enable = true;
  };

  home.username = "lucky";
  home.homeDirectory = "/home/lucky";

  programs.home-manager.enable = true;

  home.stateVersion = "25.11"; # Current version of NixOS
}
