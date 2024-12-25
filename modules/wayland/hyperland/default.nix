{ lib,
  ... }:
{
  options.modules.wayland.hyperland = 
  {
    enable = lib.mkEnableOptions "Enable the hyperland window manager";
  };
}
