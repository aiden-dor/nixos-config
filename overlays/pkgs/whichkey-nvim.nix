# Desc:
# Version Bump
# Detail:
# The version of the plugin in 24.11 doesn't have the
# picker plugin. This version bump fixes that
_:
(final: prev: {
  vimPlugins = prev.vimPlugins // {
    which-key-nvim = final.vimUtils.buildVimPlugin {
      pname = "which-key.nvim";
      version = "2025-02-17";
      src = final.fetchFromGitHub {
        owner = "folke";
        repo = "which-key.nvim";
        rev = "5bf7a73fe851896d5ac26d313db849bf00f45b78";
        sha256 = "LCcvy5uwEy01NhXCW5tlJXAK2UPgNrZTYvjuE9J34ek=";
      };
      meta.homepage = "https://github.com/folke/which-key.nvim/";
    };
  };
})
