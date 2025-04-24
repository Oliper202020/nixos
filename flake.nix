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
        overlays
      ];
    };
   # nixpkgs.overlays = [
      # Add nur overlay for Firefox addons
    #  nur.overlay
     # (import ./overlays)
    #];
    settings = import ./settings.nix;
    overlays = import ./pkgs;
  in {
    nixosConfigurations = {
      hp-victus = lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {inherit inputs settings;};
        modules = [
          inputs.solaar.nixosModules.solaar
          ./configuration.nix
          ./hosts/hp-victus
        ];
      };
    };

    homeConfigurations = {
      oliver = inputs.home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        extraSpecialArgs = {inherit inputs settings system;};
        modules = [
         # inputs.anyrun.homeManagerModules.default
          ./home.nix
        ];
      };
    };
  };
}
