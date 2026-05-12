{ pkgs, ... }:
let
  settings = import ./common/settings.nix;
  extensions = import ./common/extensions.nix { inherit pkgs; };
  containers = import ./common/containers.nix;
  policies = import ./common/policies.nix;
in
{
  programs.floorp = {
    enable = true;
    package = pkgs.floorp-bin;
    policies = {

    }
    // policies;
    profiles.oliver = {
      bookmarks = {
      };
      #isDefault = false;
      settings = {
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
      }
      // settings;
      extensions = {

      }
      // extensions;
    }
    // containers;
  };
}
