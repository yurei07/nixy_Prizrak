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
          "asus-tuff" = {
            id = "DEVICE-ID-GOES-HERE";
          };
        };
        folders = {
          "Documents" = {
            # Name of folder in Syncthing, also the folder ID
            path = "/home/${username}/Documents"; # Which folder to add to Syncthing
            devices = [
              "asus-tuff"
            ]; # Which devices to share the folder with
          };
          # "Example" = {
          #   path = "/home/myusername/Example";
          #   devices = ["device1"];
          #   ignorePerms = false; # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
          # };
        };
      };
      settings.gui = {
        user = "nixos";
        password = "$2b$05$9W3iA70SoIL87cQG/IHeQ.NOSnwKigpAVMRknQ1hAUKvFgzFOYxVO";
      };
    };
  };
}
