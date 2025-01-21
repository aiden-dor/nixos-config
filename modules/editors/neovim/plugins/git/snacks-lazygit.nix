{
  pkgs,
  ...
}:
{
  # snacks lazygit does automatic colorscheming which is cool
  plugins.snacks = {
    enable = true;
    settings.lazygit = {
      enabled = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = "function() Snacks.lazygit.open(opts) end";
      options = {
        desc = "LazyGit (root dir)";
      };
    }
  ];
}
