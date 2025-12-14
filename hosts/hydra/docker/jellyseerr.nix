
let
  base_dir = "/containers/jellyseerr";
  config_dir = "${base_dir}/config";
in
{
  systemd.tmpfiles.rules = [
    "d ${config_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."jellyseerr" = {
    image = "ghcr.io/fallenbagel/jellyseerr:latest";
    environment = {
      "TZ" = "Europe/Berlin";
    };
    ports = [
      "8097:5055"
    ];
    volumes = [
      "${config_dir}:/app/config"
    ];
  };
}
