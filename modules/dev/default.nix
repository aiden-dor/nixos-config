{ pkgs,
  lib,
  config,
  ... }:
let 
  cfg = config.modules.dev;
in {

  options.modules.dev = {
    enable = lib.mkEnableOption "Install development related packages";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lazygit 
    ];
  };
}
