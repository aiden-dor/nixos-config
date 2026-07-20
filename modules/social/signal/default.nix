{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.social = {
    signal.enable = lib.mkEnableOption "Enable signal";
  };

  config = lib.mkIf config.modules.social.signal.enable {
    home.packages = with pkgs; [
      signal-desktop
    ];
  };
}
