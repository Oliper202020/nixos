{
  imports = [
    ./fish.nix
    ./nushell.nix
    ./bash.nix
  ];
  programs = {
    lsd = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    carapace = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };
  };
}
