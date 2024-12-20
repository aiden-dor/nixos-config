{ config,
  ... }:
{
	imports = [
		../../modules/browsers
		../../modules/editors
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
