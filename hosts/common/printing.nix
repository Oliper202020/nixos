{
  lib,
  config,
  ...
}:
{
  options.printing.enable = lib.mkEnableOption {
    default = true;
  };
  config = lib.mkIf config.printing.enable {
    # enable cups and some drivers for common printers
    services = {
      printing = {
        enable = true;
      };
      # required for network discovery of printers
      avahi = {
        enable = true;
        nssmdns4 = true;
        nssmdns6 = true;
        openFirewall = true;
      };
    };
  };
}
