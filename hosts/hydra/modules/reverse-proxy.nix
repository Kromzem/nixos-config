{
  services.caddy = {
    enable = true;

    virtualHosts = {
      "palikin-host.ddns.net".extraConfig = ''
        respond "Hello, World!"  
      '';
    };
  };
}
