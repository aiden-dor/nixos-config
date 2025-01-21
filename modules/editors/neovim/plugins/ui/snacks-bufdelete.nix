{
  plugins.snacks = {
    enable = true;
    settings = {
      # Delete a buffer without effective the layout
      bufdelete = {
        enabled = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>bd";
      action.__raw = "function() Snacks.bufdelete() end";
      options = {
        desc = "Delete Buffer";
      };
    }
  ];
}
