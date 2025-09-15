{
  #description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";#"nixpkgs/nixos-unstable";
    };
    nixos-facter-modules = {
      url = "github:numtide/nixos-facter-modules";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
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
    qbittorrent = {
      url = "gitlab:salvesen1/qbittorrent-flake";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      flake = true;
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... } @ inputs: let
    lib = inputs.nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) ["ventoy"];
      };
      overlays = [
        inputs.nur.overlays.default
        inputs.qbittorrent.overlays.default
        #inputs.hyprpanel.overlay
        overlays
      ];
    };
    settings = import ./settings.nix;
    overlays = import ./pkgs;
    host = import ./hosts;
  in {

    nixosConfigurations = {
      thinkpad-l540 = lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {inherit inputs settings;};
        modules = [
          ./configuration.nix
          host.thinkpad-l540
        ];
      };
      hpe-dl380p-gen8 = lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {inherit inputs settings;};
        modules = [
          ./modules/server
          host.hpe-dl380p-gen8
        ];
      };
    };
    devshells = import ./devshells {
      inherit pkgs inputs;
    };
  };
}
