{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.games = {
    ruffle.enable = lib.mkEnableOption "Install ruffle";
  };

  config = lib.mkIf config.modules.games.ruffle.enable {
    home.packages = [
      pkgs.ruffle
    ];
  };
}
