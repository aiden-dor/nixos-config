{
  lib,
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
      settings = {
        "screenshots" = true;
        "clock" = true;
        "indicator" = true;
        "effect-blur" = "7x5";
        "fade-in" = "0.2";
        "grace" = 5;
        "indicator-radius" = "100";
      };
    };
  };
}
