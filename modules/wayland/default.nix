{ lib,
  pkgs,
  config,
  osConfig,
  ... }:
let 
  cfg = config.modules.wayland;
in {
  imports = [
    ./sway
    ./hyperland
    ./rofi.nix
  ];

  options.modules.wayland = {
      enable = lib.mkEnableOption "Use wayland protocol";
    };

  config = lib.mkIf (cfg.enable) {
    # May not be needed
    # This lets electron based applications work within
    # wayland
    # home.sessionVariables = {
    #   NIXOS_OZONE_WL = 1;
    # };

    home.packages = with pkgs; [
      # screenshot functionality
      (flameshot.override {enableWlrSupport = true;}) # may need more configuration
      grim # So flameshot works with wayland

      # clipboard functionality
      wl-clipboard 

      # allow for easy desktop mirroring
      wl-mirror

      # GUI for configuring outputs.
      # Use this for on the fly editing, use kanshi to create default setups
      wlr-layout-ui
      wlr-randr # needed to configure outputs manually
      
      # notification manager developed by swaywm maintainer
      mako 
    ]
      ++ (lib.optional osConfig.hosts.common.sound.enable wireplumber);
  };
}
