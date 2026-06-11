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
      zoom.enable = false;
      libre.enable = false;
    };

    media.sioyek.enable = true;
  };

  home.username = "lucky";
  home.homeDirectory = "/home/lucky";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05"; # Current version of NixOS
}
