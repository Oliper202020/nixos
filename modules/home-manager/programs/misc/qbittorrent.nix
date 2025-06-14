{ pkgs, inputs, ... } : {
  imports = [
    inputs.qbittorrent-flake.homeModules.default
  ];
  programs.qbittorrent = {
    enable = true;
    package = pkgs.qbittorrent-enhanced;
    settings = {
      "GUI" = {
        "DownloadTrackerFavicon" = "false";
        "StoreOpenedSearchTabs" = "true";
      };
      "LegalNotice" = {
        "Accepted" = "true";
      };
    };
    searchPluginPackages = with pkgs; [
      1337x
      audiobookbay
    ];
  };
}
