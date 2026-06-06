{ ... }:
{
  imports = [
    ../common # Common goes first, its options my be overridden by later imports.
    ./hardware-configuration.nix
    ./users.nix
  ];

  hosts.common = {
    battery_monitor.enable = true;
    bluetooth.enable = true;
    chromecast.enable = true;
    firewall = {
      spotifyLocalDiscovery.enable = true;
      ping.enable = true;
    };
    fprintd.enable = true;
    printing.enable = true;
    regreet.enable = true;
    sound.enable = true;
  };

  networking.hostName = "Bear";

  boot.binfmt.emulatedSystems = [
    "riscv64-linux"
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/a5d77715-1089-4db1-879b-b1f641713700";

  # time.timeZone = "America/Denver";
  services.automatic-timezoned.enable = true;

  # Tell logind to suspend on lid close — swayidle's before-sleep
  # will fire and lock the screen. Change to "hibernate" if you
  # prefer skipping suspend entirely.
  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchExternalPower = "lock"; # optional: just lock when plugged in
  };

  # How long to suspend before escalating to hibernate (default 180s)
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=120s
  '';
}
