{	inputs,
	outputs,
	... }:
{
	imports = [ 
		./basePackages.nix
		./boot.nix
		./fonts.nix
		./networking.nix
		./nix.nix
		./nixpkgs.nix
		./nixos.nix
		./shell.nix
	];
}
