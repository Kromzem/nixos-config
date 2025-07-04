let
  base_dir = "/containers/jellyfin";
  config_dir = "${base_dir}/config";
  cache_dir = "${base_dir}/cache";
in
{
  systemd.tmpfiles.rules = [
    "d ${config_dir} 777 palikin users -"
    "d ${cache_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."jellyfin" = {
    image = "jellyfin/jellyfin:latest";
    ports = [
      "8096:8096"
    ];
    volumes = [
      "${config_dir}:/config"
      "${cache_dir}:/cache"
      "/mnt/media:/media"
    ];
  };
}
