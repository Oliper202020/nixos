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

        /*
        * floorpsettings  **
        */
        "floorp.tabsleep.enabled" = true;
        "floorp.tabsleep.tabTimeoutMinutes" = 30;
        "floorp.titlebar.favicon.color" = true;
        "floorp.browser.tabs.verticaltab" = true;
        "floorp.verticaltab.hover.enabled" = true;
        "floorp.browser.tabbar.settings" = 2;
        "floorp.tabbar.style" = 2;
        "floorp.browser.workspaces.enabled" = false;
        "browser.newtabpage.activity-stream.floorp.background.type" = 2;
        "browser.newtabpage.activity-stream.floorp.newtab.releasenote.hide" = true;

        "extensions.webextensions.ExtensionStorageIDB.migrated.search@kagi.com" = true;
        "ui.key.menuAccessKeyFocuses" = false;
        "browser.firefox-view.feature-tour" = "{'screen':'','complete':true}";
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.bookmarks.addedImportButton" = false;
        "browser.download.useDownloadDir" = false;
        "browser.startup.homepage" = "kagi.com";
        "browser.urlbar.placeholderName" = "search for something man";
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.trending.featureGate" = false;

        /*
        * TELEMETRY **
        */
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
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
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
