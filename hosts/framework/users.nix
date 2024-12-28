{	inputs,
	outputs,
	config,
  pkgs,
	... }:
{
	imports = [
		inputs.home-manager.nixosModules.home-manager
	];

  # lets wayland run apps as root
  security.polkit.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh; 

  # Stupid so that sway shows up in greetd.
  # TODO: move this into a os config variable to enable it as a session for users by default.
  programs.sway.enable = true;

  # Stupid shit so that electron apps work 
  # I hate it and think that its stupid
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    # WAYLAND_DISPLAY = "1"; Setting this to true breaks our greeter
  };

	users.users = {
    david.isNormalUser = true;
    gorplet.isNormalUser = true;
  };

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
