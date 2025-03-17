{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    nixos-cachyos-kernel = {
      url = "github:drakon64/nixos-cachyos-kernel";
    };
  #  nixos-facter-modules = {
  #    url = "github:numtide/nixos-facter-modules";
  #  };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
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
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      flake = true;
    };
  };

  outputs = {
    nixpkgs,
    nur,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        nur.overlays.default
        inputs.hyprpanel.overlay
      ];
    };
    settings = import ./settings.nix;
  in {
    nixosConfigurations = {
      oliver = lib.nixosSystem {
        inherit system;
        modules = [
          inputs.nixos-cachyos-kernel.nixosModules.default
         # inputs.nixos-facter-modules.nixosModules.facter
         # { config.facter.reportPath = ./facter.json; }
         # { boot.loader.systemd-boot.enable = true; }
          inputs.base16.nixosModule
          inputs.solaar.nixosModules.solaar
          inputs.stylix.nixosModules.stylix
          {environment.systemPackages = [ inputs.anyrun.packages.${system}.anyrun ];}
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
        extraSpecialArgs = { inherit inputs settings; };
        modules = [
          inputs.stylix.homeManagerModules.stylix
          inputs.anyrun.homeManagerModules.default
          ./home.nix
        ];
      };
    };
  };
}
