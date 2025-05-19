{pkgs, inputs, ...}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];
  programs.zen-browser = {
    enable = true;
    policies = {
      DisableFirefoxAccounts = true;
      NoDefaultBookmarks = true;
    };
    profiles.oliver = {
      bookmarks = {
      };
      isDefault = true;
      settings = {
        "zen" = {
          "welcome-screen.seen" = true;
          "tab-unloader.timeout-minutes" = 20;
          "widget.linux.transparency" = true;
        };
        "extensions" = {
          "webextensions.ExtensionStorageIDB.migrated.search@kagi.com" = true;
          "autoDisableScopes" = 0;
        };
        "ui.key.menuAccessKeyFocuses" = false;
        "browser" = {
          "firefox-view.feature-tour" = "{'screen':'','complete':true}";
          "bookmarks.addedImportButton" = false;
          "download.useDownloadDir" = false;
          "startup.homepage" = "kagi.com";
          "newtabpage.activity-stream." = {
            "telemetry" = false;
            "feeds" = {
              "telemetry" = false;
              "topsites" = false;
            };
          };
          "urlbar" = {
            #"placeholderName" = "search for something man";
            "suggest.quicksuggest" = {
              "sponsored" = false;
              "nonsponsored" = false;
            };
            "trending.featureGate" = false;
          };
        };
        "datareporting" = {
          "policy.dataSubmissionEnabled" = false;
          "healthreport.uploadEnabled" = false;
        };
        "toolkit" = {
          "telemetry" = {
            "unified" = false;
            "enabled" = false;
            "server" = "data:,";
            "archive.enabled" = false;
            "newProfilePing.enabled" = false;
            "shutdownPingSender.enabled" = false;
            "updatePing.enabled" = false;
            "bhrPing.enabled" = false;
            "firstShutdownPing.enabled" = false;
            "coverage.opt-out" = true;
          };
          "coverage" = {
            "opt-out" = true;
            "endpoint.base" = "";
          };
        };
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
