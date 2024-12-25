{ lib,
  ... }:
{
  imports = [
    ./kitty.nix
  ];

  options.modules.terminals = {
    defaultTerminal = lib.mkOption {
      type = lib.types.string;
      default = "";
      description = "The default terminal to use across your window managers";
      example = "Kitty";
    };
  };
}
