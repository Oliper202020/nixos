{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";#"nixpkgs/nixos-unstable";
    };
    nixos-cachyos-kernel = {
      url = "github:drakon64/nixos-cachyos-kernel";
    };
    nixos-facter-modules = {
      url = "github:numtide/nixos-facter-modules";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:0x006e/home-manager";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
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
      hp-victus = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs settings;};
        modules = [
          inputs.nixos-cachyos-kernel.nixosModules.default
          inputs.base16.nixosModule
          inputs.solaar.nixosModules.solaar
          inputs.stylix.nixosModules.stylix
          inputs.nixos-facter-modules.nixosModules.facter
          {config.facter.reportPath = ./hosts/hp-victus/facter.json;}
          ./configuration.nix
          ./hosts/hp-victus/default.nix
        ];
      };
    };

    homeConfigurations = {
      oliver = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs settings system;};
        modules = [
          inputs.stylix.homeManagerModules.stylix
         # inputs.anyrun.homeManagerModules.default
          ./home.nix
        ];
      };
    };
  };
}
