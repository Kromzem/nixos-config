{ ... }: 
{
  imports = [
    # ./dashy.nix
    # ./satisfactory.nix
    ./stirling_pdf.nix
    ./jellyfin.nix
    # ./jelly-app.nix
    # ./planar_ally.nix
    # ./wishlist.nix
    ./gotify.nix
    # ./karakeep.nix
    # ./wizarr.nix
    # ./jfa_go.nix
    # ./expense_owl.nix
    # ./actual.nix
    # ./it-tools.nix # does not start as of 12.06.2025
    # ./jellyfin.nix
    # ./ghost.nix
    # ./wordpress.nix
    # ./fdm_server.nix
    ./navidrome.nix
    ./jellyseerr.nix
    ./mybibliotheca.nix
  ];

  virtualisation.oci-containers.backend = "docker";
}
