{ lib,
  config,
  pkgs,
  ... }:
{
  options.modules.games = {
    minecraft.enable = lib.mkEnableOption "Install minecraft";
  };

  config = lib.mkIf config.modules.games.minecraft.enable {
    home.packages = [
      pkgs.prismlauncher
    ];
  };
}
