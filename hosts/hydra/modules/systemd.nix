{ config, pkgs, ... }:

let
  resticRepo = "rclone:Backblaze:Palikin-Nessie-Backup";
  resticPassword = "${config.sops.secrets.restic_repo_password.path}";
in
{
  environment.systemPackages = with pkgs; [
    restic
    rclone
  ];

  systemd.services.restic-backup = {
    description = "Restic Backup Service";
    after = [ "network-online.target" ];
    requires = [ "network-online.target" ];
    script = ''
      ${pkgs.coreutils}/bin/pwd
      ${pkgs.restic}/bin/restic -r ${resticRepo} backup ./

      ${pkgs.restic}/bin/restic -r ${resticRepo} forget --prune --keep-last 2
    '';
    serviceConfig = {
      Type = "simple";
      User = "palikin";
      WorkingDirectory = "/mnt/nessie";
      Environment = [
        "RESTIC_PASSWORD_FILE=${resticPassword}"
        "RESTIC_PROGRESS_FPS=0.0166"
      ];
    };
  };

  systemd.timers.restic-backup = {
    description = "Runs Restic Backup Daily";
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
    wantedBy = [ "timers.target" ];
  };
}
