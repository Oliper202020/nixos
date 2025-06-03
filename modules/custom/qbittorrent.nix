{ config, pkgs, lib, ... }:
{
  options = {
    services.qbittorrent = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable the qBittorrent service.";
      };
      webuiPort = lib.mkOption {
        type = lib.types.int;
        default = 8080;
        description = "Port for the qBittorrent Web UI.";
      };
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.qbittorrent;
        description = "qbittorrent package to use.";
      };
      searchPlugins = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "List of search plugins to install for qBittorrent.";
      };
      configFile = lib.mkOption {
        type = lib.types.str;
        default = "${config.home}/.config/qBittorrent/qBittorrent.conf"; # Default config file path
        description = "Path to the qBittorrent configuration file.";
      };
      pluginsDir = lib.mkOption {
        type = lib.types.str;
        default = "/home/oliver/.local/share/qBittorrent/nova3/engines/"; # Default plugins directory
        description = "Directory for qBittorrent search plugins.";
      };
    };
  };

  config = lib.mkIf config.services.qbittorrent.enable {
    # Install qBittorrent
    environment.systemPackages = [ pkgs.qbittorrent ];

    # Enable the qBittorrent service
    systemd.services.qbittorrent = {
      description = "qBittorrent BitTorrent Client";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.qbittorrent}/bin/qbittorrent-nox";
        User = "your-username"; # Change to the appropriate user
        Group = "your-group";   # Change to the appropriate group
        Restart = "always";
      };
      # Set the web UI port
      environment = {
        QBITTORRENT_WEBUI_PORT = "${config.services.qbittorrent.webuiPort}";
      };
    };
    # Configure search plugins
    # Assuming search plugins are stored in a specific directory
    {
      environment.etc."qbittorrent/searchplugins".source = pkgs.writeText "searchplugins" ''
        ${lib.concatStringsSep "\n" (map (plugin: ''${plugin}'') config.services.qbittorrent.searchPlugins)}
      '';
    };
  };
}
