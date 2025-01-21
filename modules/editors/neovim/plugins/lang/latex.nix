{
  pkgs,
  ...
}:
{
  plugins.vimtex = {
    enable = true;
    # you get texliveFull. Your drive space is mine.
    texlivePackage = pkgs.texliveFull;

    settings = {
      view_method = "zathura";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ll";
      action = "<cmd>VimtexCompile<cr>";
      options = {
        desc = "Latex compile toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>lc";
      action = "<cmd>VimtexClean<cr>";
      options = {
        desc = "󰇾 Latex Clean";
      };
    }
    {
      mode = "n";
      key = "<leader>lw";
      action = "<cmd>VimtexCountWords<cr>";
      options = {
        desc = "󰆙 Word count";
      };
    }
    {
      mode = "n";
      key = "<leader>lv";
      action = "<cmd>VimtexView<cr>";
      options = {
        desc = " View PDF";
      };
    }
  ];
}
