{
  lib,
  config,
  ...
}:
{
  options.modules.browsers = {
    chrome.enable = lib.mkEnableOption "Google Chrome";
    firefox.enable = lib.mkEnableOption "Fire Fox";
  };

  config = {
    programs.google-chrome.enable = config.modules.browsers.chrome.enable;

    programs.firefox.enable = config.modules.browsers.firefox.enable;
  };
}
