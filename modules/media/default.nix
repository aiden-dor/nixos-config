{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.media;
in
{
  imports = [
    ./music
  ];

  options.modules.media = {
    sioyek.enable = lib.mkEnableOption "Install the Sioyek pdf viewer";
  };

  config = {
    home.packages = with pkgs; [
      # pdf viewer
      zathura
    ];

    programs.sioyek = {
      enable = cfg.sioyek.enable;
      # TODO: Configure Sioyek as desired in home directories then cement config in here

      # config = {
      #   "should_launch_new_window" = "1";
      # };
    };
  };
}
