let
  base_dir = "/containers/wishlisz";
  uploads_dir = "${base_dir}/uploads";
  config_dir = "${base_dir}/config";
in
{
  
  systemd.tmpfiles.rules = [
    "d ${uploads_dir} 777 palikin users -"
    "d ${config_dir} 777 palikin users -"
  ];

  virtualisation.oci-containers.containers."wishlist" = {
    image = "ghcr.io/cmintey/wishlist:latest";
    ports = [
      "1004:3280"
    ];
    volumes = [
      "${uploads_dir}:/usr/src/app/uploads"
      "${config_dir}:/usr/src/app/data"
    ];
    environment = {
      ORIGIN = "https://wishlist.palikin-cloud.de";
      TOKEM_TIME = "72";
    };
  };
}
