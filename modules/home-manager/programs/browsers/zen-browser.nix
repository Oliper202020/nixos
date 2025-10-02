{pkgs, inputs, config, ...}: let
  settings = import ./firefox/settings.nix;
  containers = import ./firefox/containers.nix;
  extensions = import ./firefox/extensions.nix { inherit pkgs; };
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
      ExtensionSettings."*".installation_mode = "force_installed";
    };
    profiles.oliver = {
      bookmarks = {
      };
      isDefault = true;
      spacesForce = true;
      spaces = let
        containers = config.programs.zen-browser.profiles.oliver.containers;
      in {
        "Personal" = {
          id = "c6de089c-410d-4206-961d-ab11f988d40a";
          icon = "https://raw.githubusercontent.com/lucide-icons/lucide/f4d451de802c7110ad7acd14f2d76746bde3ebfe/icons/house.svg";
          container = containers."Personal".id;
          position = 1000;
        };
        "School" = {
          id = "cdd10fab-4fc5-494b-9041-325e5759195b";
          icon = "https://raw.githubusercontent.com/lucide-icons/lucide/refs/heads/main/icons/school.svg";
          container = containers."School".id;
          position = 2000;
        };
      };
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
    } // containers;
  };
}
