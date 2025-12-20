{
  fileSystems."/mnt/nessie/Media" = {
    device = "192.168.178.59:/volume1/Media";
    fsType = "nfs";
  };
  
  fileSystems."/mnt/nessie/Data" = {
    device = "192.168.178.59:/volume1/Data";
    fsType = "nfs";
  };

  fileSystems."/mnt/nessie/Photo" = {
    device = "192.168.178.59:/volume1/photo";
    fsType = "nfs";
  };

  fileSystems."/mnt/nessie/Hydra" = {
    device = "192.168.178.59:/volume1/Hydra";
    fsType = "nfs";
  };
}
