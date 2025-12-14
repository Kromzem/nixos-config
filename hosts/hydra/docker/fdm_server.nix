let
  base_dir = "/containers/gdm_server";
  db_dir = "${base_dir}/db";
in
{
  systemd.tmpfiles.rules = [
    "d ${db_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."fdm_server" = {
    image = "registry.gitlab.com/fmd-foss/fmd-server:v0.12.0";
    ports = [
      "1009:8080"
    ];
    volumes = [
      "${db_dir}:/var/lib/fmd-server/db"
    ];
  };
}
