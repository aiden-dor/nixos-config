{ config,
  ... }:
{
	imports = [
		../../modules/browsers
		../../modules/editors
		../../modules/games
	];

  programs.home-manager.enable = true;

	home.stateVersion = "24.11"; # Current version of NixOS

	config = {
    modules = {
      browsers = {
        chrome.enable = true;
        firefox.enable = true;
      };

      editors = {
        neovim.enable = true;
      };

      games = {
        minecraft.enable = true;
      };
    };
  };
}
