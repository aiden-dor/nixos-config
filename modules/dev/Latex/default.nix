{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.dev.languages.latex;
in
{
  options.modules.dev.languages.latex = {
    enable = lib.mkEnableOption "Latex related packages";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # Latex
      texliveFull
    ];
  };

}
