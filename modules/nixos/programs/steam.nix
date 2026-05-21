{
  settings,
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # inputs.nixos-millennium.nixosModules.default
  ];
  options.steam.enable = lib.mkEnableOption {
    default = false;
  };
  config = lib.mkIf config.steam.enable {
    programs.steam = {
      # package = pkgs.millennium-steam.override {
      #   extraPkgs =
      #     pkgs: with pkgs; [
      #       # Workaround xorg cursor issue
      #       rose-pine-cursor
      #     ];
      # };
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    programs.gamemode.enable = true;

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOL_PATHS = "/home/${settings.username}/.steam/root/compatibilitytoold.d";
      STEAM_OVERLAY_RESOLUTION = "2880x1920";
      GDK_SCALE = "1";
    };
  };
}
