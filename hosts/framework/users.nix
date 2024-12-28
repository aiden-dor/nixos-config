{	inputs,
	outputs,
	config,
	... }:
{
	imports = [
		inputs.home-manager.nixosModules.home-manager
	];

  # Required for sway to be configured through home-manager
  # security.polkit.enable = true;

	# programs.sway = {
	# 	enable = true;
	# 	wrapperFeatures.gtk = true;
	# };

	users.users.david.isNormalUser = true;
	users.users.gorplet.isNormalUser = true;

	home-manager = {
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
      inputs.nixvim.homeManagerModules.nixvim
      inputs.stylix.homeManagerModules.stylix
    ];

		useUserPackages = true;
		useGlobalPkgs = true;

		extraSpecialArgs = {
			inherit inputs outputs;
			nixosConfig = config;
		};

		users.david = import ../../users/david;
		users.gorplet = import ../../users/gorplet;
		users.root = import ../../users/root;
	};
}
