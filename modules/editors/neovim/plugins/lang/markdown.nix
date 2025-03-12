{
  pkgs,
  ...
}:
{
  extraPackages = with pkgs; [
    ## Needed for render-markdown
    python3Packages.pylatexenc
    imagemagick
    ghostscript
  ];

  plugins.render-markdown = {
    enable = true;
    # lines above and below to not conceal
    settings = {
      anti_conceal = {
        above = 1;
        below = 1;
      };
      latex.enabled = false;
    };
  };

  plugins.snacks = {
    enable = true;
    settings = {
      image = {
        # Needs to mature a little more.
        # it is really nice though
        # enabled = true;
      };
    };
  };
}
