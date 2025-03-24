{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
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
