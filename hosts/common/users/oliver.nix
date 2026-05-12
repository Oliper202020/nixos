{
  pkgs,
  # config,
  # lib,
  inputs,
  settings,
  ...
}:
{
  users.users.oliver = {
    initialHashedPassword = "$y$j9T$KjQ6zBTQNkfHSgimDAmUx/$f.9Dq7eaUGCrNwHxAKatacg8o8JHH/k45wsrPgbRzS3";
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    description = "oliver";
    extraGroups = [
      "audio"
      "input"
      "kvm"
      "libvirtd"
      "networkmanager"
      "plugdev"
      "qemu-libvirtd"
      "video"
      "wheel"
    ];
  };
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    #useGlobalPkgs = true;
    users.oliver = import ../../../modules/home-manager;
    extraSpecialArgs = { inherit inputs settings pkgs; };
  };
}
