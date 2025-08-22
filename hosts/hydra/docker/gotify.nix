let
  data_dir = "/containers/gotify";
in
{
  systemd.tmpfiles.rules = [
    "d ${data_dir} 777 palikin users -"
  ];

  virtualisation.oci-containers.containers."gotify" = {
    image = "gotify/server";
    volumes = [
      "${data_dir}:/app/data"
    ];
    ports = [
      "1005:80"
    ];
    environment = {
      TZ = "Europe/Berlin";
    };
  };
}
