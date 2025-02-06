{ config, ... }:
{
  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
    };
    fromLua = [
      { paths = "${config.config-directory}/snippets"; }
    ];
  };
}
