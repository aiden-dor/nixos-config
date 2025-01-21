_:
(final: prev: {
  vimPlugins = prev.vimPlugins // {
    snacks-nvim = final.vimUtils.buildVimPlugin {
      pname = "snacks.nvim";
      version = "2025-01-19";
      src = final.fetchFromGitHub {
        owner = "folke";
        repo = "snacks.nvim";
        rev = "d6284d51ff748f43c5431c35ffed7f7c02e51069";
        sha256 = "0z6a3idlmalbiwlz5c6n0ycc5dn4439ffm52ml1r04jajqn8rx56";
      };
      meta.homepage = "https://github.com/folke/snacks.nvim/";
    };
  };
})
