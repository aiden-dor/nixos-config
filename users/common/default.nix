{ ... }:
{
	imports = [
    ./base.nix
    ./style.nix
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

      terminals = {
        kitty.enable = true;
        default = "kitty";
      };

      wayland = {
        # Wayland is automatically enabled when sway is enabled
        # enable = true;
        sway = {
          enable = true;
        };
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

      dev = {
        enable = true;
      };
    };
  };
}
