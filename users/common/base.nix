{ ... }:
{
  imports = [
    ../../modules/browsers
    ../../modules/editors
    ../../modules/games
    ../../modules/shells
    ../../modules/dev
    ../../modules/media
    ../../modules/social
    ../../modules/terminals
    ../../modules/wayland
  ];

  config = {
    modules = {
      browsers = {
        chrome.enable = true;
        firefox.enable = true;
      };

      editors = {
        neovim.enable = true;
      };

      shells = {
        zsh.enable = true;
      };

      dev = {
        tools.enable = true;
      };
    };
  };
}
