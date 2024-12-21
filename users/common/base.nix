{ ... }:
{
	imports = [
		../../modules/browsers
		../../modules/editors
		../../modules/games
    ../../modules/social
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
    };
  };
}
