{pkgs, ...}: {
  programs.floorp = {
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
      #isDefault = false;
      settings = {
        "extensions.autoDisableScopes" = 0;
        "floorp" = {
          "titlebar.favicon.color" = true;
          "verticaltab.hover.enabled" = true;
          "tabbar.style" = 2;
          "browser" = {
            "tabbar.settings" = 2;
            "tabs.verticaltab" = true;
          };
          "tabsleep" = {
            "enabled" = true;
            "tabTimeoutMinutes" = 30;
          };
        };

        "browser" = {
          "workspaces.enabled" = false;
          "newtabpage.activity-stream" = {
            "floorp" = {
              "background.type" = 2;
              "newtab.releasenote.hide" = true;
            };
            "telemetry" = false;
            "feeds" = {
              "telemetry" = false;
              "topsites" = false;
            };
          };
          #"firefox-view.feature-tour" = "{'screen':'','complete':true}";
          "bookmarks.addedImportButton" = false;
          "download.useDownloadDir" = false;
          "startup.homepage" = "kagi.com";
          "urlbar" = {
            "placeholderName" = "search for something man";
            "trending.featureGate" = false;
            "suggest.quicksuggest" = {
              "sponsored" = false;
              "nonsponsored" = false;
            };
          };
        };
        "extensions.webextensions.ExtensionStorageIDB.migrated.search@kagi.com" = true;
        "ui.key.menuAccessKeyFocuses" = false;
        "datareporting" = {
          "policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
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
      extensions = {
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
          floccus
          stylus
          clearurls
        ];
      };
    };
  };
}
