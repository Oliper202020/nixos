{
  #description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";#"nixpkgs/nixos-unstable";
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
      url = "github:Gerg-L/spicetify-nix/24.11";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qbittorrent-flake = {
      url = "gitlab:salvesen1/qbittorrent-flake";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      flake = true;
    };
  };

  outputs = { nixpkgs, nur, ... } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) ["ventoy"];
      };
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
    host = import ./hosts;
  in {

    nixosConfigurations = {
      #installer = lib.nixosSystem {
        #modules = [
          # setup live-bootable installer
         # host.all-hardware
         # (
           # { config, lib, modulesPath, ... }:
           # {
              #imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" ];
              #config = {
                #isoImage.isoBaseName = "nixos-my-setup";
                #networking.hostName = "nixos-my-setup";
                #system.stateVersion = lib.versions.majorMinor config.system.nixos.version;
                #nix.settings.experimental-features = [ "nix-command" "flakes" ];
                # };
              # }
            # )
          # configure disko-install-menu
         # inputs.disko-install-menu.nixosModules.default
         # {
           # programs.disko-install-menu = {
             # enable = true;
             # options = {
                # set those to your liking
               # defaultFlake = "gitlab:salvesen1/nixos";
               # defaultHost = "empty";
                # };
              # };
            # }
          # and everything else you think you might need …
          # ];
      #  system = "x86_64-linux";
     # };
      hp-victus = lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {inherit inputs settings;};
        modules = [
          ./configuration.nix
          host.hp-victus
        ];
      };
    };

    homeConfigurations = {
      oliver = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs settings system;};
        modules = [
         # inputs.anyrun.homeManagerModules.default
          ./home.nix
        ];
      };
    };
  };

}
