{...}:
{
  virtualisation.oci-containers.containers."dashy" = {
    image = "lissy93/dashy:release-3.1.1";
    ports = [
      "1000:8080"
    ];
    volumes = [
      "/containers/dashy/:/app/user-data/"
    ];
  };
}
