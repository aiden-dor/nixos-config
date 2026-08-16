{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.modules.media.photography = {
    gimp.enable = lib.mkEnableOption "Install and use GIMP photo editor";
  };

  config = lib.mkIf config.modules.media.photography.gimp.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
