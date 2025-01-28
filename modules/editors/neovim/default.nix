{
  lib,
  config,
  options,
  ...
}:
let
  cfg = config.modules.editors.neovim;
in
{
  options = {
    modules.editors = {
      neovim.enable = lib.mkEnableOption "Use the provided neovim config";
    };

    # Pass through what languages we have enabled to the nix configuration
    programs.nixvim.languages = options.modules.dev.languages;
  };

  config = lib.mkIf cfg.enable {
    stylix.targets.nixvim.enable = false;

    programs.nixvim = {
      # Pass through what languages we have enabled to the nix configuration
      languages = config.modules.dev.languages;

      enable = true;
      defaultEditor = true;

      # set vim to use neovim
      vimAlias = true;
      # dont let vi alias to neovim. Useful for large file editing
      # as neovim tends to shit itself with large >2MB files
      viAlias = false;

      imports = [
        # General Configuration
        ./settings.nix
        ./keymaps.nix
        ./auto_cmds.nix
        ./file_types.nix

        # Themes
        ./plugins/themes

        # Completion
        ./plugins/cmp/cmp.nix
        ./plugins/cmp/cmp-copilot.nix
        ./plugins/cmp/lspkind.nix
        ./plugins/cmp/autopairs.nix
        ./plugins/cmp/schemastore.nix

        # Snippets
        ./plugins/snippets/luasnip.nix

        # Editor plugins and configurations
        ./plugins/editor/neo-tree.nix
        ./plugins/editor/treesitter.nix
        ./plugins/editor/undotree.nix
        ./plugins/editor/illuminate.nix
        ./plugins/editor/snacks-indent.nix
        ./plugins/editor/todo-comments.nix
        ./plugins/editor/copilot-chat.nix
        ./plugins/editor/navic.nix

        # UI plugins
        ./plugins/ui/snacks-bufdelete.nix
        ./plugins/ui/bufferline.nix
        ./plugins/ui/lualine.nix
        ./plugins/ui/startup.nix

        # LSP and formatting
        ./plugins/lsp/lsp.nix
        ./plugins/lsp/conform.nix
        ./plugins/lsp/fidget.nix

        # Git
        ./plugins/git/snacks-lazygit.nix
        ./plugins/git/gitsigns.nix

        # Utils
        ./plugins/utils/snacks-picker.nix
        ./plugins/utils/whichkey.nix
        ./plugins/utils/extra_plugins.nix
        ./plugins/utils/mini.nix
        ./plugins/utils/markdown-preview.nix
        ./plugins/utils/toggleterm.nix
        ./plugins/utils/web-devicons.nix
        ./plugins/utils/persistence.nix

        # Language specific
        ./plugins/lang/latex.nix
      ];
    };
  };
}
