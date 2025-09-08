{ pkgs, ... }: {
  users.users.admin = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    description = "Administrator";
    extraGroups = ["networkmanager" "wheel"];
  };
}
