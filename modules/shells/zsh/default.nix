{ lib,
  config,
  ... }:
let
  cfg = config.modules.shells.zsh;
in {
  options.modules.shells = {
    zsh.enable = lib.mkEnableOption "Use the zsh shell";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      syntaxHighlighting = {
        enable = true;
      };

      autosuggestion = {
        enable = true;
        strategy = [ "history" "completion" ];
      };

      oh-my-zsh = {
        enable = true;
        theme = "rkj-repos";
        plugins = [ ]; # TODO find good plugins
      };
    };
  };

}
