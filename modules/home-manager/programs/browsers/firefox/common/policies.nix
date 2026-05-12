{
  policies =
    let
      settings = import ./settings.nix;
      mkLockedAttrs = builtins.mapAttrs (
        _: value: {
          Value = value;
          Status = "locked";
        }
      );
    in
    {
      AppAutoUpdate = false;
      BlockAboutConfig = false;
      DisableFirefoxAccounts = true;
      DisableProfileImport = true;
      DontCheckDefaultBrowser = true;
      ExtensionSettings."*".installation_mode = "force_installed";
      NoDefaultBookmarks = true;
      Preferences =
        mkLockedAttrs {
        }
        // settings;
    };
}
