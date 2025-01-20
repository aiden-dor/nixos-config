{ lib,
  pkgs, 
  config,
  ... }:
let 
  cfg = config.modules.wayland;
in {

  config = lib.mkIf (cfg.enable) {

    home.packages = with pkgs; [
      # screenshot functionality
      #  # may need more configuration
      grim # So flameshot works with wayland
      slurp
      swappy # hacked in usage 
    ];

    home.file.".config/swappy/config".text =  ''
        [Default]
        save_dir = $HOME/pictures/screenshots
        save_file_format = screenshot-%Y%m%d-%H%M%S.png
        text_font = ${config.stylix.fonts.sansSerif.name}
        early_exit = true 
        show_panel = true
      '';

    # services = {
      # Flameshot is a pain in my ass
      # Scaling issues...
      # flameshot = {
      #   enable = true;
      #   package = (pkgs.flameshot.override {enableWlrSupport = true;});
      #   settings = {
      #     General = {
      #       disableTrayIcon = true;
      #       showStartupMessage = false;
      #     };
      #   };
      # };
    # };
  };
}
