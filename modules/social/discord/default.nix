{ config,
  lib,
  pkgs,
  ... }:
{
  options.modules.social = {
    discord.enable = lib.mkEnableOption "Enable discord";
  };

  config = lib.mkIf config.modules.social.discord.enable {
    home.packages = with pkgs; [
      discord
      betterdiscordctl
    ];
  };
}
