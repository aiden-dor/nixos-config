{ lib,
  pkgs,
  config,
  ... }:
let
  cfg = config.hosts.common.regreet;
in {
  options.hosts.common.regreet = {
    enable = lib.mkEnableOption "Use regreet onthe machine";
  };

  config = lib.mkIf cfg.enable {
    programs.regreet = {
      enable = true;
      theme = {
        name = "Fluent";
        package = pkgs.fluent-gtk-theme;
      };
      settings.GTK.application_prefer_dark_theme = true;
    };
  };
}
