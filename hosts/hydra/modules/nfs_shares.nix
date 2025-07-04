{
  fileSystems."/mnt/media" = {
    device = "192.168.178.59:/volume1/Media";
    fsType = "nfs";
    # options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "r" ];
  };
}
