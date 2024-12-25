{ lib,
  config,
  options,
  ... }:
let
  cfg = config.modules.wayland.sway;
in {
  options.modules.wayland.sway = 
  {
    enable = lib.mkEnableOptions "Enable the sway window manager";
    terminal = lib.mkoption {
      type = lib.types.string;
      # Use the global default terminal if chosen. else use the default for sway
      default = if config.modules.terminals.defaultTerminal != "" then config.modules.terminals.defaultTerminal else options.wayland.windowManager.sway.terminal.default;
      description = "Default terminal to use for sway, overrides other terminal choices";
    };
  };

  config.wayland.windowManager.sway = lib.mkIf cfg.enable {
    enable = true;
    terminal = cfg.terminal;
  };
}
