{ pkgs, inputs, settings, ... }: {
  imports = [
    # ./modules/home-manager
    #./theming/theming-home.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    users.oliver = import ./modules/home-manager;
    extraSpecialArgs = { inherit inputs settings pkgs; };
  };
}
