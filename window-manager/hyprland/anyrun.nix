#location: /window-manager/hyprland/anyrun.nix
#imported: home.nix
{ inputs, pkgs, ... }: {
  programs = {
    anyrun = {
      enable = true;
      config = {
        x = { fraction = 0.5; };
        y = { fraction = 0.3; };
        width = { fraction = 0.3; };
        hideIcons = false;
        ignoreExclusiveZones = false;
        layer = "overlay";
        hidePluginInfo = false;
        closeOnClick = true;
        showResultsImmediately = true;
        maxEntries = null;
        plugins = [
          # An array of all the plugins you want, which either can be paths to the .so files, or their packages
          inputs.anyrun.packages.${pkgs.system}.applications
          inputs.anyrun.packages.${pkgs.system}.kidex
          inputs.anyrun.packages.${pkgs.system}.rink
        ];
      };
      extraCss = /*css */ ''
      .window {
        background: : rgba(0, 0, 0, 0);
      }
    '';

    };
  };
}
