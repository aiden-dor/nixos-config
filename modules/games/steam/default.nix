{ lib,
  config,
  pkgs,
  ... }:
{
  options.modules.games = {
    steam.enable = lib.mkEnableOption "Install steam";
  };

  config = lib.mkIf config.modules.games.steam.enable {
    home.packages = [
      pkgs.steam
    ];
  };
}
