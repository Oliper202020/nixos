{pkgs, ...}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [wl-clipboard];
    settings = {
      keys.normal = {
        y = "yank_to_clipboard";
        p = "paste_clipboard_after"; # Paste from clipboard after cursor
        P = "paste_clipboard_before"; # Paste from clipboard before cursor      };
      };
      # theme = "autumn_night_transparent";
      editor = {
        clipboard-provider = "wayland";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${pkgs.alejandra}/bin/alejandra";
          };
          language-servers = ["nixd"];
        }
      ];
      "language-server" = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
        };
      };
    };
    # themes = {
    # autumn_night_transparent = {
    # "inherits" = "autumn_night";
    #    "ui.background" = { };
    #};
    #    };
  };
}
