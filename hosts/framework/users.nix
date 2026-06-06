{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}:
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
  programs = {
    sway.enable = true;

    # cause we are gamers
    steam.enable = true;

  };

  # Stupid shit so that electron apps work
  # I hate it and think that its stupid
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    # WAYLAND_DISPLAY = "1"; Setting this to true breaks our greeter
  };

  users.users = {
    lucky = {
      isNormalUser = true;
      extraGroups = [
        "video"
        "networkmanager"
        "wheel"
      ];
    };
  };

  home-manager = {
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
      inputs.nixvim.homeModules.nixvim
      { nixpkgs.config.allowUnfree = true; }
      {
        stylix.targets.gnome.enable = false;
        # stylix.targets.regreet.enable = false;
        stylix.targets.zen-browser.enable = false;
        xdg.configFile."Kvantum/Base16Kvantum/Base16Kvantum.kvconfig".force = true;
        xdg.configFile."Kvantum/Base16Kvantum/Base16Kvantum.svg".force = true;
      }
    ];

    useUserPackages = true;
    useGlobalPkgs = true;

    extraSpecialArgs = {
      inherit inputs outputs;
      displayProfiles = import ./monitors.nix;
    };

    users.lucky = import ../../users/lucky;
    users.root = import ../../users/root;

  };
}
