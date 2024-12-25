{ lib,
  ... }:
{
  options.modules.wayland.hyperland = 
  {
    enable = lib.mkEnableOption "Enable the hyperland window manager";
  };
}
