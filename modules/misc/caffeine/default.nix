{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.misc.caffeine;
in
{
  options.modules.misc.caffeine = {
    enable = lib.mkEnableOption "caffeine-ng";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      caffeine-ng
    ];
  };
}
