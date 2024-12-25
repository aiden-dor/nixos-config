{ ... }:
{
	imports = [
    ./base.nix
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

      social = {
        discord.enable = true;
      };
      
      media = {
        music.spotify.enable = true;
      };
    };
  };
}
