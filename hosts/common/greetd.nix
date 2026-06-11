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

    environment.systemPackages = [
      pkgs.swaylock-effects
    ];

    services.swaylock = {
      settings = {
        effect-bg = "1e1e2e";
        effect-color = "cdd6f4";
        image = config.stylix.image;
        inside-color = "313244";
        inside-clear-color = "f38ba8";
        inside-correct-color = "a6e3a1";
        inside-wrong-color = "f38ba8";
        key-hl-color = "89b4fa";
        layout-bg-color = "313244";
        layout-text-color = "cdd6f4";
        line-color = "313244";
        line-clear-color = "f38ba8";
        line-correct-color = "a6e3a1";
        line-wrong-color = "f38ba8";
        ring-color = "313244";
        ring-clear-color = "f38ba8";
        ring-correct-color = "a6e3a1";
        ring-wrong-color = "f38ba8";
        separator-color = "00000000";
        text-color = "cdd6f4";
        text-clear-text = "INCORRECT";
        text-correct-text = "CORRECT";
        text-wrong-text = "INCORRECT";
        fading = true;
        fade-in = 0.3;
        grayscale = false;
        show-failed-attempts = true;
        timer = true;
        indicator = true;
        indicator-cylinder-color = "313244";
        indicator-ring-color = "cdd6f4";
        indicator-text-color = "cdd6f4";
        clock = true;
        time-size = 72;
        month-size = 48;
        date-size = 48;
        weekday-size = 48;
        time-color = "cdd6f4";
        date-color = "cdd6f4";
        weekday-color = "cdd6f4";
        font = "DejaVu Sans Mono";
      };
    };
  };
}
