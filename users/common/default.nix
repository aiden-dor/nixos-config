{ config,
  ... }:
{
	imports = [
		../../modules/browsers
		../../modules/editors
		../../modules/games
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

      games = {
        minecraft.enable = true;
      };
    };
  };
}
