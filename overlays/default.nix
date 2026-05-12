{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };
  # inputs.niri.overlays.niri;
  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };
  no-system =
    prev:
    let
      assertNoSystem =
        if builtins.hasAttr "system" prev then
          throw "Error: 'system' attribute is deprecated. Use 'stdenv.hostPlatform.system' instead."
        else
          prev;

    in
    assertNoSystem;
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
