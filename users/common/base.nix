{ ... }:
{
	imports = [
		../../modules/browsers
		../../modules/editors
		../../modules/games
    ../../modules/social
    ../../modules/media
    # ../../modules/wayland
    ../../terminals
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
