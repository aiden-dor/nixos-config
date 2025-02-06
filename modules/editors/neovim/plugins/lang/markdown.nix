{ pkgs, ... }:
{

  extraPackages = with pkgs; [ python3Packages.pylatexenc ];
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
}
