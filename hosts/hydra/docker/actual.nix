let
  data_dir = "/containers/actual";
in {
  
  systemd.tmpfiles.rules = [
    "d ${data_dir} 777 palikin users -"
  ];

  virtualisation.oci-containers.containers."actual" ={
    image = "actualbudget/actual-server:latest";
    ports = ["1003:5006"];
    volumes = [
      "${data_dir}:/data"
    ];    
  };
}
