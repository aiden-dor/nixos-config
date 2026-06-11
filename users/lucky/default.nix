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
      kotlin.enable = false;
    };
    
    dev.opencode = true;

    office = {
      zoom.enable = false;
      libre.enable = false;
<<<<<<< HEAD
      nextcloud.enable = true;
      keepassxc.enable = true;
=======
>>>>>>> fe958d1c18d7946f5343ba665309581ff74ff2ba
    };

    media.sioyek.enable = true;
  };

  home.username = "lucky";
  home.homeDirectory = "/home/lucky";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05"; # Current version of NixOS
}
