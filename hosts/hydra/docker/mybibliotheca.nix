let
  base_dir = "/containers/mybibliotheca";
  data_dir = "${base_dir}/data";
in
{
  systemd.tmpfiles.rules = [
    "d ${data_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."mybibliotheca" = {
    image = "pickles4evaaaa/mybibliotheca:2.1.0";
    environment = {
      "TIMEZONE" = "Europe/Berlin";
    };
    ports = [
      "5054:5054"
    ];
    volumes = [
      "${data_dir}:/app/data"
    ];
  };
}
