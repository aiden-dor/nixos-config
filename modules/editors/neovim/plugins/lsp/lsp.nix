{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.languages;
  kotlin-lsp = pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
    pname = "kotlin-lsp";
    version = "262.1668.0";  # was 262.4739.0

    src = pkgs.fetchzip {
      url = "https://download-cdn.jetbrains.com/kotlin-lsp/${finalAttrs.version}/kotlin-lsp-${finalAttrs.version}-linux-x64.zip";
      sha256 = "0v1zip57k6gng15zaid0ink91ci7phhjqysf733arb097fwnzkcc";
      stripRoot = false;
    };
  # rest stays the same

    nativeBuildInputs = [
      pkgs.makeWrapper
      pkgs.autoPatchelfHook
    ];

    buildInputs = [
      pkgs.jdk25
      pkgs.stdenv.cc.cc.lib
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/{bin,share}
      cp -r lib native kotlin-lsp.sh $out/share

      chmod +x $out/share/kotlin-lsp.sh
      substituteInPlace $out/share/kotlin-lsp.sh \
        --replace-fail 'LOCAL_JRE_PATH="$DIR/jre/Contents/Home"' 'LOCAL_JRE_PATH="${pkgs.jdk25}"' \
        --replace-fail 'LOCAL_JRE_PATH="$DIR/jre"' 'LOCAL_JRE_PATH="${pkgs.jdk25}"'
      makeWrapper $out/share/kotlin-lsp.sh $out/bin/kotlin-lsp

      runHook postInstall
    '';
  });
in
{
  plugins = {
    lsp-lines = {
      enable = true;
    };
    lsp-format = {
      enable = true;
    };
    helm = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = lib.mkMerge [
        {
          html = {
            enable = true;
          };
          lua_ls = {
            enable = true;
          };
          nil_ls = {
            enable = true;
          };
          marksman = {
            enable = true;
          };
          gopls = {
            enable = true;
          };
          # bloat
          jsonls = {
            enable = true;
          };
          yamlls = {
            enable = true;
          };
        }
        (lib.mkIf cfg.c-cpp.enable {
          clangd = {
            enable = true;
            cmd = [
              "clangd"
              "--clang-tidy"
            ];
          };
          cmake.enable = true;
        })
        (lib.mkIf cfg.kotlin.enable {
          kotlin_lsp = {
            enable = true;
            package = kotlin-lsp;
          };
          # kotlin_language_server.enable = true;
          jdtls.enable = true;
        })
        (lib.mkIf cfg.python.enable {
          pyright.enable = true;
        })
        (lib.mkIf cfg.latex.enable {
          texlab.enable = true;
          ltex = {
            enable = true;
            settings = {
              language = "en-US";
            };
          };
        })
      ];

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cf" = {
            action = "code_action";
            desc = " Quick fix";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
