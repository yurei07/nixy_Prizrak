# Users configuration for NixOS
{
  config,
  pkgs,
  ...
}: let
  username = config.var.username;
in {
  programs.zsh.enable = true;
  hardware.uinput.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    groups.uinput.members = ["${username}"];

    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = ["networkmanager" "wheel" "uinput"];
    };
  };
}
