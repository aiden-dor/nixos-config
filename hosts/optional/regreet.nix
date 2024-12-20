{ pkgs,
  config,
  ... }:
{
  programs.regreet = {
    enable = true;
    theme = {
      name = "Fluent";
      package = pkgs.fluent-gtk-theme;
    };
    settings.GTK.application_prefer_dark_theme = true;
  };
}



