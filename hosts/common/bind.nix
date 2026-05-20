{
  lib,
  config,
  ...
}:
let
  cfg = config.hosts.common.ssh;
in
{
  options.hosts.common.dns = {
    enable = lib.mkEnableOption "Enable dns server";
  };

  config = lib.mkIf cfg.enable {

    hosts.common.firewall.extraInputConfig = ''
      # allow dns
      udp dport 53 accept
    '';

    services.bind = {
      enable = true;
    };
  };
}
