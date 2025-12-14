let
  base_dir = "/containers/ghost";
  content_dir = "${base_dir}/content";
in
{
  systemd.tmpfiles.rules = [
    "d ${content_dir} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."ghost" = {
    image = "ghost:6";
    ports = [
      "1008:2368"
    ];
    volumes = [
      "${content_dir}:/var/lib/ghost/content"
    ];
    environment = {
      database__client = "sqlite3";
      database__connection__filename = "/var/lib/ghost/content/data/ghost.db";
    };
  };
}
