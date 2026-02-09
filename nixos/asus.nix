# Asus laptop configuration for NixOS
# Import this only if you have an Asus laptop
{pkgs, ...}: {
  systemd.services.supergfxd.path = [pkgs.pciutils];

  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };

    supergfxd.enable = true;

    hardware.openrgb.enable = true;

    power-profiles-daemon.enable = true;
    thermald.enable = true;

    udev.extraRules = ''
      # On Battery
      SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="${pkgs.asusctl}/bin/asusctl profile -p Quiet"
      SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="${pkgs.brightnessctl}/bin/brightnessctl set 50%%"
      SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="${pkgs.asusctl}/bin/asusctl -v off"

      # On AC
      SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="${pkgs.asusctl}/bin/asusctl profile -p Balanced"
    '';
  };
}
