let
  base_dir = "/containers/planar_ally";
  config_dir = "${base_dir}/data";
  cache_dir = "${base_dir}/assets";
in
{
  systemd.tmpfiles.rules = [
    "d ${config_dir} 777 palikin users -"
    "d ${cache_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."planar_ally" = {
    image = "kruptein/planarally:latest";
    ports = [
      "1001:8000"
    ];
    volumes = [
      "${config_dir}:/planarally/data/"
      "${cache_dir}:/planarally/static/assets/"
    ];
  };
}

