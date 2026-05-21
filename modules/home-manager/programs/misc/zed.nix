{
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "hyprlang"
      "clangd"
      "omnisharp"
      "pylsp"
      "autocorrect"
    ];
    mutableUserSettings = true;
    extraPackages = with pkgs; [
      nil
      statix
      nixd
    ];
    userSettings = {
      telemetry = {
        metrics = false;
      };
      default_model = {
        provider = "ollama";
        model = "demodllc/demod-nix-assistant:8b";
      };
    };
    # lsp = {
    #  nix = {
    #   binary = {
    #    path = lib.getExe pkgs.nil;
    #path_lookup = true;
    # };
    #};
    #   };
  };
}
