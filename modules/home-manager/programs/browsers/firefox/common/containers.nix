#{ config }:
let
  #colors = config.lib.stylix.colors;
in {
  containersForce = true;
  containers = {
    Personal = {
      color = "orange";#"${colors.base08}";
      icon  = "fingerprint";
      id    = 1;
    };
    School = {
      color = "red";#"${colors.base0E}";
      icon  = "briefcase";
      id    = 2;
    };
  };
}
