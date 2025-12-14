let
  base_dir = "/containers/jfa-go";
  data_dir = "${base_dir}/data";
in
{
  systemd.tmpfiles.rules = [
    "d ${data_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."jfa-go" = {
    image = "hrfee/jfa-go";
    ports = [
      "1007:8056"
    ];
    volumes = [
      "${data_dir}:/data"
      "/etc/localtime:/etc/localtime:ro"
    ];
  };
}

