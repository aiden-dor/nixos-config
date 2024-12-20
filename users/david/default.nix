{	... }:
{
	imports = [ 
		../common
    ./secrets
	];

	home.username = "david";
	home.homeDirectory = "/home/david";

	programs.home-manager.enable = true;

	home.stateVersion = "24.11"; # Current version of NixOS
}
