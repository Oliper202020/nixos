{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "hyprlang"
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
