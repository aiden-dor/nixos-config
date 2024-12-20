{	pkgs,
	... }:
{
	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	fonts = {
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "Hack" ];})
		];

		fontconfig.defaultFonts = {
			monospace = [ "Hack" ];
		};
	};

	console = {
		font = "Lat2-Terminus16";
		keyMap = "us";
	};
}

