{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
    ../../themes/black-metal-venom.nix
  ];

  config.var = {
    hostname = "nixos";
    username = "laptop_prizrak";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Berlin";
    timeZone = "Europe/Berlin";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "ru_RU.UTF-8";

    git = {
      username = "yurei07";
      email = "125127108+yurei07@users.noreply.github.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # DON'T TOUCH THIS
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
