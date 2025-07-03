{ ... }:
{
  virtualisation.oci-containers.containers."satisfactory-server" = {
    image = "wolveix/satisfactory-server:latest";
    hostname = "satisfactory-server";
    
    ports = [
      "7777:7777/tcp"
      "7777:7777/udp"
      "8888:8888/tcp"
    ];
    volumes = [
      "/containers/satisfactory:/config"
    ];
    environment = {
      MAXPLAYERS = "2";
      PGID = "100";
      PUID = "1000";
      STEAMBETA = "false";
    };
    extraOptions = [
      "--memory-reservation=4G"
      "--memory=8G"  
    ];
  };
}
