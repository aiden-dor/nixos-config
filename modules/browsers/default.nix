{ lib, config, inputs, pkgs, ... }:
{
  imports = [ inputs.zen-browser.homeModules.default ];

  options.modules.browsers = {
    chrome.enable = lib.mkEnableOption "Google Chrome";
    firefox.enable = lib.mkEnableOption "Firefox";
    zen.enable = lib.mkEnableOption "Zen Browser";
  };

  config = {
    programs.google-chrome.enable = config.modules.browsers.chrome.enable;
    programs.firefox.enable = config.modules.browsers.firefox.enable;
    programs.zen-browser.enable = config.modules.browsers.zen.enable;
  };
}