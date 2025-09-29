{ pkgs, settings, ... }: {
  users.users.${settings.username} = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    description = "${settings.full-name}";
    extraGroups = ["networkmanager" "wheel"];
  };
}
