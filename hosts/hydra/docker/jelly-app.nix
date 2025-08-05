{
  virtualisation.oci-containers.containers."jelly-app" = {
    image = "ghcr.io/stannnnn/jelly-music-app:latest";
    ports = ["1002:80"];
    environment = {
      DEFAULT_JELLYFIN_URL = "https://stream.palikin-cloud.de";
      LOCK_URL = "true";
    };
  };
}
