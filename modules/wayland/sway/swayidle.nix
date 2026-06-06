{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.modules.wayland.sway;
  swaymsg = "${pkgs.sway}/bin/swaymsg";
  swaylock = "${lib.getExe pkgs.swaylock-effects} --daemonize --grace 0";
  systemctl = "${pkgs.systemd}/bin/systemctl";
in
{
  config = lib.mkIf cfg.enable {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 60;
          command = "${lib.getExe pkgs.light} -O && ${lib.getExe pkgs.light} -T 0.55";
          resumeCommand = "${lib.getExe pkgs.light} -I";
        }
        {
          timeout = 235;
          command = "${lib.getExe pkgs.light} -T 0.55";
          resumeCommand = "${lib.getExe pkgs.light} -I";
        }
        {
          # Fix: swaymsg, not sway
          timeout = 240;
          command = "${swaymsg} 'output * dpms off'";
          resumeCommand = "${swaymsg} 'output * dpms on'";
        }
        {
          timeout = 260;
          command = swaylock;
        }
        {
          timeout = 270;
          command = "${systemctl} suspend";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = swaylock;
        }
        # Lock on lid close, then hibernate after a delay
        {
          event = "lock";
          command = swaylock;
        }
      ];
    };
  };
}