{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.dev.languages.python;
in
{
  options.modules.dev.languages.python = {
    enable = lib.mkEnableOption "Python related packages";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      python3
    ];
  };

}
