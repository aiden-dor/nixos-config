# Desc:
# Version Bump
# Detail:
# The version of the plugin in 24.11 doesn't have the
# picker plugin. This version bump fixes that
_:
(final: prev: {
  vimPlugins = prev.vimPlugins // {
    snacks-nvim = final.vimUtils.buildVimPlugin {
      pname = "snacks.nvim";
      version = "2025-02-17";
      src = final.fetchFromGitHub {
        owner = "folke";
        repo = "snacks.nvim";
        rev = "acedb16ad76ba0b5d4761372ca71057aa9486adb";
        sha256 = "JeqcNv8QW/5QlqxkWZBCboP+B0KYmj/0gC+BN3JWhLs=";
      };
      meta.homepage = "https://github.com/folke/snacks.nvim/";
    };
  };
})
