{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "hyprlang"
      "clangd"
      "omnisharp"
      "pylsp"
    ];
    extraPackages = [
      pkgs.nixd
    ];
    userSettings = {
      telemetry = {
        metrics = false;
      };
    };
  };
}
