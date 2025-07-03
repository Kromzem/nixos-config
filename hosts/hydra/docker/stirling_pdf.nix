{...}:
let 
  base_path = "/containers/stirling-pdf";
  training_data_dir_path = "${base_path}/trainingData";
  extra_configs_dir_path = "${base_path}/extraConfigs";
in
{
  systemd.tmpfiles.rules = [
    "d ${training_data_dir_path} 777 palikin users -"
    "d ${extra_configs_dir_path} 777 palikin users -"
  ];
  
  virtualisation.oci-containers.containers."stirling-pdf" = {
    image = "frooodle/s-pdf:latest";
    ports = [
      "8080:8080"
    ];
    volumes = [
      "${training_data_dir_path}:/usr/share/tesseract-ocr/4.00/tessdata"
      "${extra_configs_dir_path}:/configs"
    ];
  };
}
