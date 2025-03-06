{config, inputs, pkgs, ...}: {
  programs.floorp = {
    enable = true;
    profiles.oliver = {
      bookmarks = {
      };
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        privacy-badger
        youtube-shorts-block
        indie-wiki-buddy
        reddit-enhancement-suite
        kagi-search
        darkreader
        sponsorblock
        facebook-container
        faststream
        don-t-fuck-with-paste
        videospeed
        i-dont-care-about-cookies
      ];
    };
  };
}
