{	pkgs,
  lib,
  config,
  ... }:
let
  cfg = config.hosts.common.fprintd;
in {
  options.hosts.common.fprintd = {
    enable = lib.mkEnableOption "Enable fprintd on the machine";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.fprintd
    ];

    services.fprintd.enable = true;
  };
}
