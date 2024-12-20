{ lib,
  config,
  pkgs,
  ... }:
{
  config = lib.mkIf config.modules.games.minecraft.enable {
    home.packages = [
      pkgs.minecraft
    ];
  };
}
