{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.modules.wayland;
in
{
  config = lib.mkIf cfg.enable {

    # can be left enabled if we are using sway or not
    wayland.windowManager.sway.config.bars = [
      {
        command = "${pkgs.waybar}/bin/waybar";
      }
    ];

    # Stylix's config for waybar kinda sucks
    # Date 01/01/25
    stylix.targets.waybar.enable = false;

    programs.waybar = {
      enable = true;

      settings =
        let
          endLeftWrap = name: name ++ [ "custom/right-arrow-dark" ];
          endRightWrap = name: [ "custom/left-arrow-dark" ] ++ name;
          leftWrap = name: [ "custom/right-arrow-light" ] ++ name ++ [ "custom/right-arrow-dark" ];
          rightWrap = name: [ "custom/left-arrow-dark" ] ++ name ++ [ "custom/left-arrow-light" ];
          centerWrap = name: [ "custom/left-arrow-dark" ] ++ name ++ [ "custom/right-arrow-dark" ];
        in
        [
          {
            layer = "top";
            position = "top";

            modules-left =
              if cfg.sway.enable then (endLeftWrap [ "sway/workspaces" ]) ++ (leftWrap [ "sway/mode" ]) else [ ];
            modules-center =
              (rightWrap [ "tray" ])
              ++ (centerWrap [ "clock" ])
              ++ (leftWrap [ "custom/clipboard" ])
              ++ (leftWrap [
                "temperature"
                "cpu"
              ]);

            modules-right =
              (rightWrap [ "network" ])
              ++ (rightWrap [ "pulseaudio" ])
              ++ (rightWrap [ "backlight" ])
              ++ (endRightWrap [ "battery" ]);

            # Sway specific
            "sway/workspaces" = {
              disable-scroll = true;
              all-outputs = true;
              on-click = "activate";
              format = "<span>{name}</span> {windows}";
              format-windows-separator = " | ";
              window-rewrite-default = "{name}";
              window-format = "{name}";
              window-rewrite = {
                "class<Google-chrome>" = "";
                "class<discord>" = "";
                "class<spotify>" = "";
                "class<kitty>" = "";
              };
              sort-by-number = true;
            };

            "sway/mode" = {
              format = "{}";
              tooltip = false;
            };

            # General
            clock = {
              format = "{:%H:%M}";
              tooltip-format = "{:%m-%d-%y}";
            };

            backlight = {
              format = "{icon}  {percent}%";
              format-icons = [
                "󰛩"
                "󱩏"
                "󱩑"
                "󱩓"
                "󱩕"
                "󰛨"
              ];
              tooltip-format = "{percent}%";
            };

            battery = {
              interval = 10;
              states = {
                warning = 30;
                critical = 15;
              };
              format-time = "{H}:{M:02}";
              format = "{icon} {capacity}%";
              format-charging = "{icon}󱐋 {capacity}%";
              format-charging-full = "󱐋";
              format-full = "󰁹{icon}";
              format-alt = "{icon} {power}W";
              format-icons = [
                "󰂎"
                "󰁻"
                "󰁽"
                "󰁿"
                "󰂁"
                "󰁹"
              ];
              tooltip-format = "{timeTo}";
            };

            cpu = {
              format = " {usage}%";
              states = {
                warning = 75;
                critial = 90;
              };
            };

            disk = {
              format = "󰋊 {free}";
              tooltip-format = "used {used} total {total}";
            };

            network = {
              format = "{ifname}";
              format-wifi = "{icon} {essid}";
              format-alt = "{ipaddr} {icon}";
              format-alt-click = "click-right";
              format-icons = {
                wifi = [
                  "󰤯"
                  "󰤟"
                  "󰤢"
                  "󰤥"
                  "󰤨"
                ];
                ethernet = [ "󰈁" ];
                disconnected = [ "" ];
              };
              on-click = "${config.modules.terminals.default} -e nmtui";
              tooltip-format = "{ipaddr}/{cidr}";
            };

            memory = {
              format = "󰍛 {avail} GiB";
              tooltip-format = "total {total}GiB";
            };

            pulseaudio = {
              format = "{icon} {volume}%";
              format-bluetooth = "󰂯 {icon} {volume}%";
              format-muted = "󰝟";
              format-icons = {
                headphone = "";
                default = [
                  "󰕿"
                  "󰖀"
                  "󰕾"
                ];
              };
              scroll-step = 1;
              on-click = "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
              tooltip-format = "{desc}";
            };

            tray = {
              format = "{}";
              spacing = 10;
            };

            temperature = {
              format = "{icon}{temperatureC}°C";
              critical-threshold = 100;
              format-icons = [
                ""
                ""
                ""
                ""
                ""
              ];
              tooltip = false;
            };

            # custom Modules
            "custom/clipboard" = {
              format = "󰅍";
              on-click = "swaymsg -q exec '$clipboard'";
              tooltip = false;
            };

            "custom/left-arrow-dark" = {
              format = "";
              tooltip = false;
            };
            "custom/left-arrow-light" = {
              format = "";
              tooltip = false;
            };
            "custom/right-arrow-dark" = {
              format = "";
              tooltip = false;
            };
            "custom/right-arrow-light" = {
              format = "";
              tooltip = false;
            };
          }
        ];

      style =
        with config.stylix;
        with config.lib.stylix.colors.withHashtag;
        ''
          @define-color background ${base00}; @define-color background-alt ${base01};
          @define-color background-select ${base02};
          @define-color selected ${base0D};
          @define-color text-color ${base05}; @define-color text-color-alt ${base04};
          @define-color warning ${base0A}; @define-color urgent ${base09};
          @define-color error ${base08};
          * {
            /* Reset all styles */
            border: none;
            border-radius: 0;
            min-height: 0;
            margin: 0;
            padding: 0;
            box-shadow: none;
            text-shadow: none;
            -gtk-icon-shadow: none;

            /* Custom styling */
            font-family: "${fonts.monospace.name}";
            font-size: ${builtins.toString fonts.sizes.desktop}pt;
          }

          window#waybar {
            background: alpha(@background, ${builtins.toString opacity.desktop});
            color: @text-color;
          }

          /* All Modules */
          #battery,
          #backlight,
          #clock,
          #cpu,
          #custom-clipboard,
          #disk,
          #mode,
          #memory,
          #network,
          #pulseaudio,
          #tray,
          #temperature,
          #workspaces button,
          #workspaces {
            background: @background-alt;
            padding-left: 8pt;
            padding-right: 8pt;
          }

          /* Warning */
          #battery.warning,
          #cpu.warning {
            color: @urgent;
          }

          /* Critical */
          #battery.critical,
          #cpu.critical,
          #temperature.critical {
            color: @error;
          }

          /* sway mode i.e(resize audio) */
          #mode {
            color: @urgent;
          }   

          /* Workspace stuff*/
          #workspaces button.focused {
            color: @selected;
          }

          /* Custom arrow */
          #custom-right-arrow-dark, #custom-left-arrow-dark {
            color: @background-alt;
          }
          #custom-right-arrow-light, #custom-left-arrow-light {
            color: @background;
            background: @background-alt;
          }
        '';
    };
  };
}
