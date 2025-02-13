{ config, ... }:
{
  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      exit_roots = false;
      keep_roots = true;
      link_roots = true;
    };
    fromLua = [
      { paths = "${config.config-directory}/snippets"; }
    ];
  };
}
