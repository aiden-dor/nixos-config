{ lib,
  config,
  ... }:
let
  cfg = config.hosts.common.printing;
in {
  options.hosts.common.printing = {
    enable = lib.mkEnableOption "Enable printing on the machine";
  };

  config = lib.mkIf cfg.enable {
    # Enable CUPS to print documents.
    services.printing.enable = true;
  };
}
