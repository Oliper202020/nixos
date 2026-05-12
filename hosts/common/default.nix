{
  lib,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ./users
    # ./uutils.nix
    ./keyboard.nix
    ./boot.nix
    ./kmscon.nix
    ./fingerprint.nix
  ];
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      inputs.lix-module.overlays.default
      inputs.nur.overlays.default
      inputs.millennium.overlays.default
    ];
    config = {
      allowUnfree = true;
      allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) [ "ventoy" ];
    };
  };
  networking.networkmanager.enable = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command flakes" ];
      trusted-users = [
        "root"
        "oliver"
      ];
    };
    optimise.automatic = true;
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
      (lib.filterAttrs (_: lib.isType "flake")) inputs
    );
  };
}
