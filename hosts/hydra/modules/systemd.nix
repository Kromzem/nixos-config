{ config, pkgs, self, ... }:

let
  resticRepo = "rclone:Backblaze:Palikin-Nessie-Backup";
  resticPassword = "${config.sops.secrets.restic_repo_password.path}";
  push_password = "${config.sops.secrets.gotify_backup_api_key.path}";
in
{
  environment.systemPackages = with pkgs; [
    restic
    rclone
    curl
  ];

  systemd.services.restic-backup = {
    description = "Restic Backup Service";
    after = [ "network-online.target" ];
    requires = [ "network-online.target" ];
    path = [
      pkgs.curl
      pkgs.restic
    ];
    script = ''
      ${pkgs.coreutils}/bin/pwd
      ${pkgs.bash}/bin/bash ${self}/scripts/send_notification.sh ${push_password} "Cloud-Backup" "[START] Upload"
      ${pkgs.restic}/bin/restic -r ${resticRepo} backup ./
      if [ $? -eq 0 ]; then
        ${pkgs.bash}/bin/bash ${self}/scripts/send_notification.sh ${push_password} "Cloud-Backup" "[COMPLETED] Upload"
      else
        ${pkgs.bash}/bin/bash ${self}/scripts/send_notification.sh ${push_password} "Cloud-Backup" "[FAILED] Upload"
      fi

      ${pkgs.bash}/bin/bash ${self}/scripts/send_notification.sh ${push_password} "Cloud-Backup" "[START] Cleanup"
      ${pkgs.restic}/bin/restic -r ${resticRepo} forget --prune --keep-last 2
      if [ $? -eq 0 ]; then
        ${pkgs.bash}/bin/bash ${self}/scripts/send_notification.sh ${push_password} "Cloud-Backup" "[COMPLETED] Cleanup"
      else
        ${pkgs.bash}/bin/bash ${self}/scripts/send_notification.sh ${push_password} "Cloud-Backup" "[FAILED] Cleanup"
      fi
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
