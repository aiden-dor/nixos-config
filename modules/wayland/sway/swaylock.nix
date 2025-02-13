{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.modules.wayland.sway;
in
{
  config = lib.mkIf cfg.enable {
    # Config shamelessly stolen
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        "screenshots" = true;
        "clock" = true;
        "indicator" = true;
        "grace" = 5;
        "effect-blur" = "7x5";
        "fade-in" = "0.2";
        "indicator-radius" = "100";
      };
    };
  };
}
