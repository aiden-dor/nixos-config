{
  inputs,
  outputs,
  config,
  pkgs,
  lib,
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

  # Enable Sway as a session for greetd
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
        stylix.targets.zen-browser.enable = false;
      }
      ({ lib, ... }: {
        options.stylix.targets.kvantum = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      })
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
