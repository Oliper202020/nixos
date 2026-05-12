{
  programs.zen-browser.policies =
    let
      mkExtensionSettings = builtins.mapAttrs (
        _: pluginId: {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
          installation_mode = "force_installed";
        }
      );
    in
    {
      ExtensionSettings = mkExtensionSettings {
        "{74145f27-f039-47ce-a470-a662b129930a}" = "ClearURLs";
        "addon@darkreader.org" = "Dark Reader";
        "addon@darkreader.or" = "Dark Reader";
        "addon@darkreader.og" = "Dark Reader";
        "addon@darkreader.rg" = "Dark Reader";
        "addon@darkreaderorg" = "Dark Reader";
        "addon@darkreade.org" = "Dark Reader";
        "addon@darkreadr.org" = "Dark Reader";
        "addon@darkreaer.org" = "Dark Reader";
        "addon@darkreder.org" = "Dark Reader";
        "addon@darkrader.org" = "Dark Reader";
        "addon@darkeader.org" = "Dark Reader";
        "addon@darreader.org" = "Dark Reader";
        "addon@dakreader.org" = "Dark Reader";
        "addon@drkreader.org" = "Dark Reader";
        "addon@arkreader.org" = "Dark Reader";
      };
    };
}
