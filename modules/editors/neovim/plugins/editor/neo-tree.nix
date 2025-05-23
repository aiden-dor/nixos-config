{
  plugins.neo-tree = {
    enable = true;
    sources = [
      "filesystem"
      "buffers"
      "git_status"
      "document_symbols"
    ];
    addBlankLineAtTop = false;

    filesystem = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
      };
    };

    defaultComponentConfigs = {
      # indent = {
      #   withExpanders = true;
      #   expanderCollapsed = "󰅂";
      #   expanderExpanded = "󰅀";
      #   expanderHighlight = "NeoTreeExpander";
      # };
      #
      # icon = {
      #   folderClosed = "󰉋 ";
      #   folderOpen = "󰝰 ";
      #   folderEmpty = "󰉖 ";
      #   folderEmptyOpen = "󰷏 ";
      #   default = "*";
      #   highlight = "NeoTreeFileIcon";
      # };
      #
      # gitStatus = {
      #   symbols = {
      #     # change type
      #     added = " ";
      #     deleted = " ";
      #     modified = " ";
      #     renamed = " ";
      #
      #     # status type
      #     untracked = " ";
      #     ignored = " ";
      #     unstaged = "";
      #     staged = "";
      #     conflict = " ";
      #   };
      # };
    };
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Open/Close Neotree";
      };
    }
  ];
}
