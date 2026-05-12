{
  pkgs,
  inputs,
  config,
  ...
}:
let
  settings = import ./common/settings.nix;
  containers = import ./common/containers.nix;
  extensions = import ./common/extensions.nix { inherit pkgs; };
  policies = import ./common/policies.nix;
  colors = config.lib.stylix.colors;
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];
  programs.zen-browser = {
    enable = true;
    policies = {

    }
    // policies;
    profiles.oliver = {
      bookmarks = {
      };
      isDefault = true;
      spacesForce = true;
      spaces =
        let
          containers = config.programs.zen-browser.profiles.oliver.containers;
        in
        {
          "Personal" = {
            id = "c6de089c-410d-4206-961d-ab11f988d40a";
            icon = "https://raw.githubusercontent.com/lucide-icons/lucide/f4d451de802c7110ad7acd14f2d76746bde3ebfe/icons/house.svg";
            container = containers."Personal".id;
            position = 1000;
            theme = {
              #type = "gradient";
              opacity = 0.8;
              texture = 0.05;
              colors = [
                {
                  red = builtins.fromJSON "${colors.base08-rgb-r}";
                  green = builtins.fromJSON "${colors.base08-rgb-g}";
                  blue = builtins.fromJSON "${colors.base08-rgb-b}";
                  # custom = true;
                  #algorithm = "complementary";
                }
              ];
            };
          };
          "School" = {
            id = "cdd10fab-4fc5-494b-9041-325e5759195b";
            icon = "https://raw.githubusercontent.com/lucide-icons/lucide/refs/heads/main/icons/school.svg";
            container = containers."School".id;
            position = 2000;
            theme = {
              # type = "gradient";
              # rotation = 45;
              opacity = 0.8;
              texture = 0.05;
              colors = [
                {
                  red = builtins.fromJSON "${colors.base0B-rgb-r}";
                  green = builtins.fromJSON "${colors.base0B-rgb-g}";
                  blue = builtins.fromJSON "${colors.base0B-rgb-b}";
                  # custom = true;
                  # algorithm = "complementary";
                  # type = "explicit-lightness";
                }
              ];
            };
          };
        };
      pins =
        let
          containers = config.programs.zen-browser.profiles.oliver.containers;
          #  spaces = config.programs.zen-browser.profiles.oliver.spaces;
          # pins = config.programs.zen-browser.profiles.oliver.pins;
        in
        {
          "mail" = {
            id = "9d8a8f91-7e29-4688-ae2e-da4e49d4a179";
            container = containers."Personal".id;
            url = "https://mail.proton.me/u/0/inbox/";
            isEssential = true;
            position = 101;
          };
          "Nix awesome" = {
            id = "d85a9026-1458-4db6-b115-346746bcc692";
            isGroup = true;
            isFolderCollapsed = false;
            editedTitle = true;
            position = 200;
          };
          "Nix Packages" = {
            id = "f8dd784e-11d7-430a-8f57-7b05ecdb4c77";
            #folderParentId = pins."Nix awesome".id;
            url = "https://searchix.ovh/";
            position = 201;
          };
          "Nix Options" = {
            id = "92931d60-fd40-4707-9512-a57b1a6a3919";
            #folderParentId = pins."Nix awesome".id;
            url = "https://search.nixos.org/options";
            position = 202;
          };
          "Home Manager Options" = {
            id = "2eed5614-3896-41a1-9d0a-a3283985359b";
            #folderParentId = pins."Nix awesome".id;
            url = "https://home-manager-options.extranix.com";
            position = 203;
          };
        };
      settings = {
        zen = {
          welcome-screen.seen = true;
          view.experimental-no-window-controls = true;
          tab-unloader.timeout-minutes = 20;
          widget.linux.transparency = true;
        };
      }
      // settings;
      search = {
        default = "Kagi";
        privateDefault = "duckduckgo";
        engines = {
          "Kagi" = {
            urls = [
              {
                template = "https://kagi.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "https://kagi.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@k" ];
          };
          "duckduckgo" = {
            urls = [
              {
                template = "https://duckduckgo.com/?q={searchTerms}";
              }
            ];
            icon = "https://duckduckgo.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@d" ];
          };
        };
        force = true; # this is required because otherwise the search.json.mozlz4 symlink gets replaced on every firefox restart
      };
      extensions = {
      }
      // extensions;
    }
    // containers;
  }
  // policies;
}
