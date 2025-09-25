{ pkgs, ... }: {
  force = true;
  packages = with pkgs.nur.repos.rycee.firefox-addons; [
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
    istilldontcareaboutcookies
    flagfox
    clearurls
  ];
}
