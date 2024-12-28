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
    ./bluetooth.nix
    ./firewall
    ./fprintd.nix
    ./printing.nix
    ./regreet.nix
    ./sound.nix
	];

  hosts = {
    common = {
      firewall = {
        ping.enable = true;
      };
    };
  };
}
