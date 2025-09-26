{pkgs, inputs, ...}: let
  settings = import ./firefox/settings.nix;
  extensions = import ./firefox/extensions.nix{ inherit pkgs; };
in {
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
      } // settings;
      search = {
        default = "Kagi";
        privateDefault = "duckduckgo";
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
          "duckduckgo" = {
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

      } // extensions;
    }; #// containers;
  };
}
