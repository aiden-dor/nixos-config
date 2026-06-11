{
  imports = [
    # base doesn't have a lot of user things
    ../common/base.nix
  ];

  # allowUnfree set in shared config due to useGlobalPkgs

  home.username = "root";
  home.homeDirectory = "/root";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05"; # Current version of NixOS
}
