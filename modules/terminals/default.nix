{ lib,
  ... }:
{
  imports = [
    ./kitty.nix
  ];

  options.modules.terminals = {
    default = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "The default terminal to use across your window managers";
      example = "kitty";
    };
  };
}
