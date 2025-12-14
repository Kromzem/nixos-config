let
  base_dir = "/containers/wizarr";
  data_dir = "${base_dir}/data";
in
{
  systemd.tmpfiles.rules = [
    "d ${data_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."wizarr" = {
    image = "ghcr.io/wizarrrr/wizarr";
    ports = [
      "1006:5690"
    ];
    volumes = [
      "${data_dir}:/data"
    ];
    environment = {
      DISABLE_BUILTIN_AUTH = "false";
      PUID = "1000";
      GUID = "1000";
      TZ = "Europe/Berlin";
    };
  };
}
