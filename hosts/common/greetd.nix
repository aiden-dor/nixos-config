{ lib, pkgs, config, ... }:
let
  cfg = config.hosts.common.greetd;
in {
  options.hosts.common.greetd = {
    enable = lib.mkEnableOption "Use greetd for display management";
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Sway";
          user = "greeter";
        };
      };
    };

    users.users.greeter = {
      isSystemUser = true;
      description = "Greeter User";
    };
  };
}
