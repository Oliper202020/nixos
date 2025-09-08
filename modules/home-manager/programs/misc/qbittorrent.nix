{ pkgs, inputs, ... } : {
  imports = [
    inputs.qbittorrent.homeModules.default
  ];
  programs.qbittorrent = {
    enable = true;
    package = pkgs.qbittorrent-enhanced;
    settings = {
      "GUI" = {
        "DownloadTrackerFavicon" = "false";
        "StoreOpenedSearchTabs" = "true";
      };
      "Preferences" = {
        "Search/MigrateStatus" = "true";
        "Search/SearchEnabled" = "true";
      };
      "LegalNotice" = {
        "Accepted" = "true";
      };
    };
    searchPluginPackages = with pkgs.qbittorrentPlugins; [
      one337x
      #audiobookbay
      academictorrents
      acgrip
      ali213
      anidex
      animetosho
      audiobookbay
      bitsearch
      bt4gprx
      btdig
      calidadtorrent
      cloudtorrents
      cpasbien
      darklibria
    ];
  };
}
