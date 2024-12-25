{	... }:
{
	imports = [ 
		../common
	];

	home.username = "gorplet";
	home.homeDirectory = "/home/gorplet";

  programs.home-manager.enable = true;

	home.stateVersion = "24.11"; # Current version of NixOS
}
