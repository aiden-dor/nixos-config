{
  inputs = {
    # I have 0 idea how the follows thing works along with the version pinning
    # I should probably learn how it works before this gets too complicated
    nixpkgs.url = "github:NixOs/nixpkgs/release-26.05";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix/release-26.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    #nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nix-minecraft.url = "github:Catmaniscatlord/nix-minecraft";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      commonModules = [
        inputs.sops-nix.nixosModules.sops
      ];

      mkSystem =
        modules:
        nixpkgs.lib.nixosSystem {
          modules = modules ++ commonModules ++ [{
            nixpkgs.config.allowUnfree = true;
          }];
          specialArgs = { inherit inputs; };
        };
    in
    {
      nixosConfigurations = {
        Bear = mkSystem [
          ./hosts/bear
#          inputs.stylix.nixosModules.stylix # Move stylix out of user space, was importing it into both hosts' user.nix and causes warning 
        ];
      };
    };

}
