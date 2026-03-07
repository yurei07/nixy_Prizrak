{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.user.services.replays = {
    description = "GPU Screen Recorder Replays";
    after = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = ''
        ${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder -w DP-1 -q very_high -k hevc -a default_output -a alsa_input.usb-ME6S_MS_N-B_R-UN__3db_ME6S-00.mono-fallback -f 60 -r 3600 -c mp4 -o %h/Games/LongReplays
      '';
    };
  };
}
