{ ... }:
{
  imports = [
    ../common
  ];

  # allowUnfree set in shared config due to useGlobalPkgs

  modules = {
    dev.languages = {
      latex.enable = true;
      python.enable = true;
      c-cpp.enable = true;
      kotlin.enable = false;
    };

    dev.opencode.enable = true;

    shells.zsh.theme = "lambda";

    wayland.sway.tap = "enabled";

    browsers = {
      zen.enable = true;
    };

    office = {
      zoom.enable = false;
      libre.enable = false;
      nextcloud.enable = true;
      keepassxc.enable = true;
    };

    games.ruffle.enable = true;

    social = {
      signal.enable = true;
    };

    misc.caffeine.enable = true;

    media.sioyek.enable = true;
  };

  home.username = "lucky";
  home.homeDirectory = "/home/lucky";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05"; # Current version of NixOS
}
