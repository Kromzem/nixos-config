let
  base_dir = "/containers/navidrome";
  data_dir = "${base_dir}/data";
in
{
  systemd.tmpfiles.rules = [
    "d ${data_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."navidrome" = {
    image = "deluan/navidrome:latest";
    ports = [
      "1010:4533"
    ];
    volumes = [
      "${data_dir}:/data"
      "/mnt/media/music:/music:ro"
    ];
  };
}
