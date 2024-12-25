{	inputs,
	outputs,
	config,
	... }:
{
	imports = [
		inputs.home-manager.nixosModules.home-manager
	];

  # Required for sway to be configured through home-manager
  security.polkit.enable = true;


	users.users.david.isNormalUser = true;
	users.users.gorplet.isNormalUser = true;

	home-manager = {
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
      inputs.nixvim.homeManagerModules.nixvim
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
