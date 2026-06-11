{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.office.nextcloud;
in
{
  options.modules.office = {
    nextcloud.enable = lib.mkEnableOption "Nextcloud Client";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nextcloud-client
    ];
  };

}
