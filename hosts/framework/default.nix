{	pkgs,
	... }: 
{
	imports = [
		../common # Common goes first, its options my be overridden by later imports.
		../optional/printing.nix
		../optional/regreet.nix
		../optional/sound.nix
		../optional/fprintd.nix
		./hardware-configuration.nix
		./users.nix
	];

	hosts.common = {
    shell.fancyShell = true;
    networking.spotifyLocalDiscovery.enable = true;
  };

	networking.hostName = "DavidFramework";

	time.timeZone = "America/Denver";

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		flameshot
		# (flameshot.override{enableWlrSupport=true;}) # screenshot functionality
		grim # So flameshot works with sway
		wl-clipboard # wl-copy and wl-paste for wayland 
		mako # notification manager developed by swaywm maintainer
		rofi # application launcher
	];

	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};

	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}

