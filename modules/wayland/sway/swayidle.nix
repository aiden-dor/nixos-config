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
            command = "${lib.getExe pkgs.light} -O && ${lib.getExe pkgs.light} -T 0.3";
            resumeCommand = "${lib.getExe pkgs.light} -I";
          }
          {
            timeout = 240;
            command = "${lib.getExe pkgs.sway} 'output * dpms off'";
            resumeCommand = "${lib.getExe pkgs.sway} 'output * dpms on'";
          }
          {
            timeout = 260;
            command = "${lib.getExe pkgs.swaylock-effects} --daemonize";
          }
          {
            timeout = 270;
            command = "${pkgs.systemd}/bin/systemctl suspend";
          }
        ];
        events = [
          {
            event = "before-sleep";
            command = "${lib.getExe pkgs.swaylock-effects} --daemonize --grace 0";
          }
        ];
      };
    };
  };
}
