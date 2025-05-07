{
  config,
  pkgs,
  ...
}:

{
  services.tlp.enable = true;

  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 20;
    STOP_CHARGE_THRESH_BAT0 = 80;

    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

  };
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
