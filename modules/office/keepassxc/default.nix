{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.office.keepassxc;
in
{
  options.modules.office = {
    keepassxc.enable = lib.mkEnableOption "Keepassxc Password Manager";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
        keepassxc
    ];
  };

}
