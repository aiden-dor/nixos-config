{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    ## Needed for render-markdown
    python3Packages.pylatexenc

    ## needed for diagram
    mermaid-cli
  ];

  plugins.render-markdown = {
    enable = true;
    # lines above and below to not conceal
    settings = {
      anti_conceal = {
        above = 1;
        below = 1;
      };
    };
  };

  ## Image support in markdown
  plugins.image = {
    enable = true;
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "diagram";
      src = pkgs.fetchFromGitHub {
        owner = "3rd";
        repo = "diagram.nvim";
        rev = "554d4f407d68662e5f5e41882241302077682225";
        hash = "sha256-N+Xh4aLe5XeSS5GL6TVbZoTi7DunK9iGRZnxkSZ/nlg=";
      };
    })
  ];

  extraConfigLua = ''
    require("diagram").setup({
      integrations = {
        require("diagram.integrations.markdown"),
      },
      renderer_options = {
        mermaid = {
          background="transparent",
          theme = "forest",
        } ,
      },
    })
  '';
}
