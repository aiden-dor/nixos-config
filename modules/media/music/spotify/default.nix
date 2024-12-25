{ pkgs,
  lib,
  config,
  ... }:
{
  options.modules.media.music = {
    spotify.enable = lib.mkEnableOption "Install and use the native spotify client";
  };

  config = lib.mkIf config.modules.media.music.spotify.enable {
    home.packages = with pkgs; [
        spotify
    ];
  };
}
