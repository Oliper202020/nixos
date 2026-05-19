{
  pkgs,
  ...
}:
{
  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/start-hyprland";
          user = "oliver";
        };
        default_session = initial_session;
        #terminal.vt = 1;
      };
    };
  };
}
