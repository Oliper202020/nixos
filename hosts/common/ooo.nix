{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.hardware.facter.report.hardware.monitor {
  imports = [
    #inputs.spicetify-nix.homeManagerModules.default
    inputs.home-manager.nixosModules.home-manager
  ];
  options.spicetify.enable = lib.mkOption {
    default = false;
  };
  config = lib.mkIf config.spicetify.enable {
    home-manager = {
      # extraSpecialArgs = { inherit inputs settings pkgs; };
      users.oliver = {
        wayland.windowManager.hyprland = {
          enable = true;
        };
  };
}
