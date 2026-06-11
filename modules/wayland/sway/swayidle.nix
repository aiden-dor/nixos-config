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
          command = "${lib.getExe pkgs.brightnessctl} -s set 1%";
          resumeCommand = "${lib.getExe pkgs.brightnessctl} -r";
        }
        {
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
      events = {
        before-sleep = swaylock;
        # Lock on lid close, then hibernate after a delay
        lock = swaylock;
      };
    };
  };
}