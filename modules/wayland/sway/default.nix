{ lib,
  pkgs,
  config,
  options,
  ... }:
let
  cfg = config.modules.wayland.sway;
in {
  options.modules.wayland.sway = 
  {
    enable = lib.mkEnableOption "Enable the sway window manager";
    terminal = lib.mkOption {
      type = lib.types.str;

      # Use the global default terminal if chosen. else use the default for sway
      default = options.modules.terminals.default.value;
      apply = value: if value != "" then value else options.wayland.windowManager.sway.config.value.terminal;

      description = "Default terminal to use for sway, Overrides the chosend global default";
    };
  };

  config = lib.mkIf cfg.enable {
    # automatically anable wayland if using sway
    modules.wayland.enable = true;

    # Necessary packages that we will need
    home.packages = with pkgs; [

    ];

    wayland.windowManager.sway = {
      enable = true;

      config = let
        mod = "Mod4";
      in {
        modifier = "${mod}";
        terminal = cfg.terminal;

        fonts = {
          # names = []; #Handeled by stylix
          size = 10.0;
        };

        # see sway-input(5) for more details
        # There are a lot of options here to check out 
        input = {
         "type:touchpad" = {
            #dwt = disable while typing
            dwt = "enabled";
            tap = "enabled";
            natural_scroll = "enabled";
            middle_emulation = "enabled";
          };
        };

        focus = {
          # Doesn't wrap focus, i.e focus left on left most window doesnt wrap 
          # to the right
          # wrapping = false; # default false 
          # Don't follow the mouse to change window focus
          # Should still change on click
          followMouse = false;
        };

        gaps = {
          # Size fo the gaps to use between windows in pixels
          inner = 5;
          outer = 0;
          # This option controls whether to disable container borders on workspace with a single container.
          smartBorders = "on";
          # This option controls whether to disable all gaps (outer and inner) on workspace with a single container.
          smartGaps = true;
        };

        assigns = {
          "4" = [
            {instance = "discord"; }
          ];
          "spotify" = [
            { instace = "spotify"; }
          ];
        };
      };
    };
  };
}
