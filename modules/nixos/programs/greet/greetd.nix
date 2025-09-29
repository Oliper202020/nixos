{ pkgs, ... }: {
  services = {
    greetd = {
      enable = false;
      settings = rec {
        initial_session = {
          command = "${pkgs.regreet}";# and ${pkgs.hyprlock}/bin/hyprlock";
          user = "oliver";
        };
        default_session = initial_session;
        terminal.vt = 1;
      };
    };
  };
}
