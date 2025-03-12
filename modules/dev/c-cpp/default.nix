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
      gnumake

      # tools
      clang-tools
      valgrind
      cppcheck
      codespell

      # compilers
      # Conflict issue for 'c++' between gcc and clang
      # use gcc's binary in this conflict
      (lib.hiPrio gcc)
      clang
    ];
  };

}
