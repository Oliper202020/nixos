{
  imports = [
    ./common
  ];
  hp-victus = import ./hp-victus;
  framework = import ./framework;
  hpe-dl380p-gen8 = import ./hpe-dl380p-gen8;
  thinkpad-l540 = import ./thinkpad-l540;
  #common = import ./common;
  #installer = import ./installer;
  #pveGuest = import ./pveGuest;
  #pveGuestHwSupport = import ./pveGuestHwSupport;
}
