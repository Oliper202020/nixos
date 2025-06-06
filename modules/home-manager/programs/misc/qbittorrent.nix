{ pkgs, inputs, ... } : {
  imports = [
    inputs.qbittorrent-flake.homeModules.default
  ];
  programs.qbittorrent = {
    enable = true
    package = pkgs.qbittorrent-enhanced;
    settings = {
      "DownloadTrackerFavicon" = false;
      "StoreOpenedSearchTabs" = true;
      };
    searchPlugins = {
      "https://gist.githubusercontent.com/scadams/56635407b8dfb8f5f7ede6873922ac8b/raw/f654c10468a0b9945bec9bf31e216993c9b7a961/one337x.py"
    };
  };
}
