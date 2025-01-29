{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.languages;
in
{
  config = {
    extraConfigLuaPre =
      # lua
      ''
        local slow_format_filetypes = {}

        vim.api.nvim_create_user_command("FormatDisable", function(args)
           if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end, {
          desc = "Disable autoformat-on-save",
          bang = true,
        })
        vim.api.nvim_create_user_command("FormatEnable", function()
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
        end, {
          desc = "Re-enable autoformat-on-save",
        })
        vim.api.nvim_create_user_command("FormatToggle", function(args)
          if args.bang then
            -- Toggle formatting for current buffer
            vim.b.disable_autoformat = not vim.b.disable_autoformat
          else
            -- Toggle formatting globally
            vim.g.disable_autoformat = not vim.g.disable_autoformat
          end
        end, {
          desc = "Toggle autoformat-on-save",
          bang = true,
        })
      '';
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
           end
        '';

        format_after_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if not slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            return { lsp_fallback = true }
          end
        '';
        notify_on_error = true;
        formatters_by_ft = lib.mkMerge [
          {
            html = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            css = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            javascript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            typescript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            lua = [ "stylua" ];
            markdown = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            nix = [ "ixfmt-rfc-style" ];
            yaml = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            json = [ "jq" ];
            terraform = [ "terraform_fmt" ];
            bicep = [ "bicep" ];
            bash = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            "_" = [ "trim_whitespace" ];
          }

          (lib.mkIf cfg.c-cpp.enable {
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
            cmake = [ "cmake-format" ];
          })
          (lib.mkIf cfg.kotlin.enable {
            kotlin = [ "ktlint" ];
          })
          (lib.mkIf cfg.python.enable {
            python = [
              "black"
              "isort"
            ];
          })
          (lib.mkIf cfg.latex.enable {
            tex = [ "tex-fmt" ];
          })
        ];

        formatters = lib.mkMerge [
          {
            nixfmt-rfc-style = {
              command = "${lib.getExe pkgs.nixfmt-rfc-style}";
            };
            alejandra = {
              command = "${lib.getExe pkgs.alejandra}";
            };
            jq = {
              command = "${lib.getExe pkgs.jq}";
            };
            prettierd = {
              command = "${lib.getExe pkgs.prettierd}";
            };
            stylua = {
              command = "${lib.getExe pkgs.stylua}";
            };
            shellcheck = {
              command = "${lib.getExe pkgs.shellcheck}";
            };
            shfmt = {
              command = "${lib.getExe pkgs.shfmt}";
            };
            shellharden = {
              command = "${lib.getExe pkgs.shellharden}";
            };
            bicep = {
              command = "${lib.getExe pkgs.bicep}";
            };
            #yamlfmt = {
            #  command = "${lib.getExe pkgs.yamlfmt}";
            #};
          }
          (lib.mkIf cfg.c-cpp.enable {
            clang-format = {
              command = "${pkgs.clang-tools}/bin/";
            };

            cmake-format = {
              command = "${lib.getExe pkgs.cmake-format}";
            };
          })
          (lib.mkIf cfg.python.enable {
            black = {
              command = "${lib.getExe pkgs.black}";
            };
            isort = {
              command = "${lib.getExe pkgs.isort}";
            };
          })
          (lib.mkIf cfg.kotlin.enable {
            ktlint = {
              command = "${lib.getExe pkgs.ktlint}";
            };
          })
          (lib.mkIf cfg.latex.enable {
            tex-fmt = {
              command = "${lib.getExe pkgs.tex-fmt}";
            };
          })
        ];
      };
    };
  };
}
