{	inputs,
	outputs,
	nixosConfig,
	... }:
{
	imports = [ 
		../common
	];

	home.username = "root";
	home.homeDirectory = "/root";

	programs.home-manager.enable = true;

	home.stateVersion = "24.11"; # Current version of NixOS
}
