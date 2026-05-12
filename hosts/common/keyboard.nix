{
  pkgs,
  ...
}:
{
  services = {
    kmscon.useXkbConfig = true;
    xserver = {
      xkb = {
        layout = "us";
        # variant = "workman";
      };
    };
    # caps to esc
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            global = {
              default_layout = "workman"; # Base layout
            };
            main = {
              capslock = "escape"; # Optional: Remap CapsLock to Escape
              rightalt = "layer(altgr)"; # Map Right Alt to "altgr" layer
            };
            altgr = {
              # Layer for homerow/æøå
              j = "macro(compose 0 2 )"; # æ (compose: 0 + 2 + u)
              k = "macro(compose 0 3 c)"; # ø (compose: 0 + 3 + c)
              l = "macro(compose a a)"; # å (compose: a + a)
              "AltGr" = "main";
            };
          };
        };
      };
    };
  };
  environment.sessionVariables = {
    "XKB_DEFAULT_OPTIONS" = "compose:menu";
    "XCOMPOSEFILE" = "${pkgs.keyd}/share/keyd/keyd.compose";
    # "libinput/local-overrides.quirks".text = ''
    #   [Serial Keyboards]
    #   MatchUdevType=keyboard
    #   MatchName=keyd virtual keyboard
    #   AttrKeyboardIntegration=internal
    # '';
  };
}
