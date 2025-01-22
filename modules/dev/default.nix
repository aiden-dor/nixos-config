{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.dev.tools;
in
{

  imports = [
    ./Latex
    ./Kotlin
  ];

  options.modules.dev.tools = {
    enable = lib.mkEnableOption "Install development related packages";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # tools
      lazygit
    ];
  };
}
