{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.misc.caffeine;
in
{
  options.modules.misc = {
    caffeine.enable = lib.mkEnableOption "Caffeine to prevent screen lcok";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      caffeine-ng
    ];
  };

}
