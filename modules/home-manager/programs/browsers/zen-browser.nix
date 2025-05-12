{pkgs, inputs, system, ...}: {
  programs.zen = {
    enable = true;
    package = inputs.zen-browser.packages."${system}".default;
    profiles.oliver = {
      bookmarks = {
      };
      isDefault = true;
      settings = {
        "extensions.autoDisableScopes" = 0;
        /*
        * ZEN **
        */
        "zen.welcome-screen.seen" = true;
        "zen.tab-unloader.timeout-minutes" = 20;
        "zen.widget.linux.transparency" = true;

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
          clearurls
         # stylus
        ];
      };
    };
  };
}
