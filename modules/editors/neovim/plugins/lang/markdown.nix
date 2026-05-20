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
        ignore = {
          code_background = true;
          indent = true;
          sign = true;
          virtual_lines = true;
        };
      };
      latex.enabled = false;
      html.enabled = true;

      overrides = {
        buflisted = { };
        buftype = {
          nofile = {
            render_modes = true;
            anti_conceal = {
              enabled = false;
            };
            padding = {
              highlight = "NormalFloat";
            };
            sign = {
              enabled = false;
            };
          };
        };
        filetype = { };
      };
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
