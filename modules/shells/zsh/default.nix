{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.shells.zsh;
in
{
  options.modules.shells = {
    zsh.enable = lib.mkEnableOption "Use the zsh shell";
    zsh = {
      theme = lib.mkOption {
        type = lib.types.str;
        default = "lambda";
        description = "rkj-repos";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      syntaxHighlighting = {
        enable = true;
      };

      autosuggestion = {
        enable = true;
        strategy = [
          "history"
          "completion"
        ];
      };

      oh-my-zsh = {
        enable = true;
        theme = cfg.theme;
        plugins = [ ]; # TODO find good plugins
      };

      initContent = ''
        nix() {
          if [[ $1 == "develop" ]]; then
            shift
            command nix develop -c $SHELL "$@"
          else
            command nix "$@"
          fi
        }
      '';

      shellAliases = {
        lg = "lazygit";
        nix-shell = "nix-shell --run $SHELL";
      };
    };
  };

}
