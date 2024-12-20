{ lib,
  ... }:
{
  imports = [
    ./minecraft
  ];

  options.modules.games = {
    minecraft.enable = lib.mkEnableOption "Install minecraft";
  };
}
