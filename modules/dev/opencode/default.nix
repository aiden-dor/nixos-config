{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.dev.opencode;
in
{
  options.modules.dev.opencode = {
    enable = lib.mkEnableOption "opencode AI coding assistant";

    model = lib.mkOption {
      type = lib.types.str;
      default = "llama-local/qwen3.5-35b";
      description = "Default model for opencode sessions";
    };

    localLlamaURL = lib.mkOption {
      type = lib.types.str;
      default = "http://192.168.1.8:8080/v1";
      description = "Base URL for the local llama.cpp server";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      opencode
    ];

    home.file.".config/opencode/config.json".text = builtins.toJSON {
      "$schema" = "https://opencode.ai/config.json";
      model = cfg.model;
      autoshare = false;
      provider = {
        "llama-local" = {
          name = "llama.cpp (R730xd)";
          npm = "@ai-sdk/openai-compatible";
          options = {
            baseURL = cfg.localLlamaURL;
          };
          models = {
            "qwen-coder" = {
              name = "qwen3.5-35b";
            };
          };
        };
      };
    };
  };
}

