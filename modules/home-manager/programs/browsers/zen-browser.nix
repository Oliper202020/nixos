{pkgs, inputs, ...}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];
  programs.zen-browser = {
    enable = true;
    policies = {
      DisableFirefoxAccounts = true;
      NoDefaultBookmarks = true;
      DisableProfileImport = true;
      DontCheckDefaultBrowser = true;
    };
    profiles.oliver = {
      bookmarks = {
      };
      isDefault = true;
      settings = {
        "zen.welcome-screen.seen" = true;
        "zen.tab-unloader.timeout-minutes" = 20;
        "zen.widget.linux.transparency" = true;
        "extension.webextensions.ExtensionStorageIDB.migrated.search@kagi.com" = true;
        "extension.autoDisableScopes" = 0;
        "ui.key.menuAccessKeyFocuses" = false;
        "browser.firefox-view.feature-tour" = "{'screen':'','complete':true}";
        "browser.bookmarks.addedImportButton" = false;
        "browser.download.useDownloadDir" = false;
        "browser.startup.homepage" = "kagi.com";
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.trending.featureGate" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
      };
      search = {
        default = "Kagi";
        privateDefault = "ddg";
        engines = {
          "Kagi" = {
            urls = [{
              template = "https://kagi.com/search";
              params = [
                { name = "q"; value = "{searchTerms}"; }
              ];
            }];
            icon = "https://kagi.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@k" ];
          };
          "ddg" = {
            urls = [{
              template = "https://duckduckgo.com/?q={searchTerms}";
            }];
            icon = "https://duckduckgo.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@d" ];
          };
        };
        force = true; # this is required because otherwise the search.json.mozlz4 symlink gets replaced on every firefox restart
      };
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
          youtube-shorts-block
          indie-wiki-buddy
          reddit-enhancement-suite
          #kagi-search
          darkreader
          sponsorblock
          facebook-container
          faststream
          don-t-fuck-with-paste
          videospeed
          istilldontcareaboutcookies
          flagfox
          floccus
          clearurls
         # stylus
        ];
      };
    };
  };
}
