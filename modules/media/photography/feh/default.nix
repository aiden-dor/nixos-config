{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.modules.media.photography = {
    feh.enable = lib.mkEnableOption "Install and use feh image viewer";
  };

  config = lib.mkIf config.modules.media.photography.feh.enable {
    home.packages = with pkgs; [
      feh
    ];
  };
}
