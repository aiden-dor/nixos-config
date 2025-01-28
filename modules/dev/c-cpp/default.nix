{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.dev.languages.c-cpp;
in
{
  options.modules.dev.languages.c-cpp = {
    enable = lib.mkEnableOption "c-cpp related packages";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # build system
      cmake

      # tools
      clang-tools
      valgrind

      # compilers
      gcc
      clang
    ];
  };

}
