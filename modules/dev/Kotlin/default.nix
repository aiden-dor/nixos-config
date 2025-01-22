{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.dev.languages.kotlin;
in
{
  options.modules.dev.languages.kotlin = {
    enable = lib.mkEnableOption "Kotlin related packages";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # Latex
      gradle
    ];
  };

}
