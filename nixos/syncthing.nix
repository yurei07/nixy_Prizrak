{
  config,
  pkgs,
  ...
}: let
  username = config.var.username;
in {
  services = {
    syncthing = {
      enable = true;
      user = "${username}";
      dataDir = "/home/${username}/Documents";
      # configDir = "/home/${username}/.config/syncthing";
      overrideDevices = true; # overrides any devices added or deleted through the WebUI
      overrideFolders = true; # overrides any folders added or deleted through the WebUI
      guiAddress = "0.0.0.0:8384";
      settings = {
        devices = {
          "nixos" = {
            id = "JCDHPZH-MPBDYEY-Y654UWR-DD6Z6M3-CM3IY3Y-EBBMT42-725POJU-RDVHIAV";
          };
        };
        folders = {
          "Documents" = {
            # Name of folder in Syncthing, also the folder ID
            path = "/home/${username}/Documents"; # Which folder to add to Syncthing
            devices = [
              "nixos"
            ]; # Which devices to share the folder with
            versioning = {
              type = "staggered";
              params = {
                cleanInterval = "3600"; # every 1 hour check the folder
                maxAge = "2592000"; # max 30 days
              };
            };
          };
          "dev" = {
            path = "/home/${username}/dev";
            devices = [
              "nixos"
            ];
            versioning = {
              type = "staggered";
              params = {
                cleanInterval = "3600"; # every 1 hour check the folder
                maxAge = "2592000"; # max 30 days
              };
            };
          };
        };
      };
      settings.gui = {
        user = "nixos";
        password = "$2b$05$9W3iA70SoIL87cQG/IHeQ.NOSnwKigpAVMRknQ1hAUKvFgzFOYxVO";
      };
    };
  };
}
