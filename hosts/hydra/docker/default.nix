{ ... }: 
{
  imports = [
    ./dashy.nix
    ./satisfactory.nix
    ./stirling_pdf.nix
    ./jellyfin.nix
    ./jelly-app.nix
    ./planar_ally.nix
    # ./actual.nix
    # ./it-tools.nix # does not start as of 12.06.2025
    # ./jellyfin.nix
  ];

  virtualisation.oci-containers.backend = "docker";
}
