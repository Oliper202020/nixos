
{ pkgs, inputs, settings, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    users.oliver = import [
      ./programs
      ./wm
      ./config.nix
      ../../theming/theming-home.nix
    ];
    extraSpecialArgs = { inherit inputs settings pkgs; };
  };
}
