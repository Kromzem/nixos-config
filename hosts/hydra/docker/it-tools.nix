{
  virtualisation.oci-containers.containers."it-tools" = {
    image = "corentinth/it-tools:latest";
    ports = [
      "8000:80"
    ];
  };
}
