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
    services = {
      swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 60;
            command = "${pkgs.light}/bin/light -O && ${pkgs.light}/bin/light -T 0.3";
            resumeCommand = "${pkgs.light}/bin/light -I";
          }
          {
            timeout = 240;
            command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
            resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
          }
          {
            timeout = 260;
            command = "${pkgs.swaylock-effects}/bin/swaylock --daemonize";
          }
          {
            timeout = 290;
            command = "${pkgs.systemd}/bin/systemctl suspend";
          }
        ];
        events = [
          {
            event = "before-sleep";
            command = "${pkgs.swaylock-effects}/bin/swaylock --daemonize";
          }
        ];
      };
    };
  };
}
