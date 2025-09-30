{ pkgs, ... }: {
  services.kmscon = {
    enable = true;
    autologinUser = "oliver";
    extraOptions = "--term xterm-256color";
    fonts = [ { name = "JetBrainsMono Nerd Font"; package = pkgs.nerd-fonts.jetbrains-mono; } ];
    extraConfig = "font-size=12";
  };
}
