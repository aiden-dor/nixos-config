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
		./nixos.nix
		./nixpkgs.nix
		./shell.nix
    ./firewall
	];

  hosts = {
    common = {
      firewall = {
        ping.enable = true;
      };
    };
  };
}
