{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
    };
    base16 = {
      url = "github:SenchoPens/base16.nix";
    };
    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    settings = import ./settings.nix;

    # Add the deckthemes package here
    deckthemes = pkgs.callPackage ./myPkgs/deckthemes/default.nix {};

  in {
    # Add the package to the 'packages.x86_64-linux' attribute set
    packages.x86_64-linux = {
      deckthemes = deckthemes;
    };

    nixosConfigurations = {
      oliver = lib.nixosSystem {
        inherit system;
        modules = [
          inputs.base16.nixosModule
          inputs.solaar.nixosModules.solaar
          inputs.stylix.nixosModules.stylix
          ./configuration.nix
        ];
        specialArgs = {
          inherit inputs settings;
        };
      };
    };

    homeConfigurations = {
      oliver = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs settings;
        };
        modules = [
          inputs.stylix.homeManagerModules.stylix
          ./home.nix
        ];
      };
    };
  };
}

