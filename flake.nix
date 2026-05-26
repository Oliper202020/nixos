{
  description = "Nugget likes the pretty Lily. He also misses her brother, Billy. Nugget likes the Lily's hair. Nugget likes to smell her chair.";
  outputs =
    {
      self,
      home-manager,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      settings = import ./settings.nix;
    in
    {
      overlays = import ./overlays { inherit inputs; };
      nixConfig = {
        extra-substituters = [
          "https://noctalia.cachix.org"
        ];
        extra-trusted-public-keys = [
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };
      nixosConfigurations = {
        thinkpad-l540 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./configuration.nix
            ./hosts/thinkpad-l540
          ];
        };
        framework = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs settings; };
          modules = [
            ./configuration.nix
            ./hosts/framework
          ];
        };
      };
    };

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = {
      url = "github:hercules-ci/flake-parts";
    import-tree.url = {
      url = "github:vic/import-tree";
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
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # apple-emoji-ttf = {
    #   url = "https://github.com/samuelngs/apple-emoji-ttf";
    # };
    nixcord = {
      url = "github:FlameFlag/nixcord";
    };
    qbittorrent = {
      url = "gitlab:salvesen1/qbittorrent-flake";
    };
    nixos-millennium = {
      url = "github:re1n0/nixos-millennium";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
    disko = {
      url = "github:nix-community/disko/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
