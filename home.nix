{ pkgs, inputs, settings, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    users.oliver = import ./modules/home-manager;
    extraSpecialArgs = { inherit inputs settings pkgs; };
  };
}
