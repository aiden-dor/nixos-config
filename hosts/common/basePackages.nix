{	pkgs,
	... }:
{
	environment.systemPackages = with pkgs; [
		# dev packages
		vim
		git

		# filesystem management
		tree
		rename
		fzf

		# downloading/web tools
		wget
		curl

		# system management
		htop
		btop
	];
}
