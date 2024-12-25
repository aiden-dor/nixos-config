{ lib,
  pkgs,
  config,
  ... }:
let 
  cfg = config.modules.wayland;
in {
  imports = [
    ./sway
    ./hyperland
  ];

  config = lib.mkIf (cfg.sway.enable || cfg.hyperland.enable) {
    # This lets electron based applications work within
    # wayland
    home.sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };

    home.packages  = with pkgs; [
      # screenshot functionality
      (flameshot.override {enableWlrSupport = true;}) # may need more configuration
      grim # So flameshot works with wayland

      # clipboard functionality
      wl-clipboard 

      mako # notification manager developed by swaywm maintainer
      rofi # application launcher
    ];

  };
}
