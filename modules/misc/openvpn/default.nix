{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.misc.openvpn;
in
{
  options.modules.misc = {
    openvpn.enable = lib.mkEnableOption "OpenVPN VPN access";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      openvpn
    ];
  };

}
