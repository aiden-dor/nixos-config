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

	hosts = {
    common = {
      shell.fancyShell = true;
      firewall.spotifyLocalDiscovery.enable = true;
    };
  };

	networking.hostName = "DavidFramework";

	time.timeZone = "America/Denver";

}

