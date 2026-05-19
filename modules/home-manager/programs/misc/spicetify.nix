{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
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
        imports = [
          inputs.spicetify-nix.homeManagerModules.default
        ];
        programs.spicetify = {
          enable = true;
          wayland = true;
          windowManagerPatch = true;
          enabledExtensions = with spicePkgs.extensions; [
            #addToQueueTop
            history
            volumePercentage
            betterGenres
            beautifulLyrics
          ];
          enabledCustomApps = with spicePkgs.apps; [
            newReleases
            ncsVisualizer
            lyricsPlus
          ];
          enabledSnippets = with spicePkgs.snippets; [
            rotatingCoverart
            pointer
          ];
          #theme = lib.mkForce spicePkgs.themes.text;
          #colorScheme = lib.mkForce "RosePine";
        };
      };
    };
  };
}
