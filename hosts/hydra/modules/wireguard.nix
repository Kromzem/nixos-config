{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
    checkReversePath = false;
    enable = false;
  };
  # networking.enableIPv6 = true;
  
  # Enable WireGuard
  networking.wireguard.enable = true;
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      # ips = [ "aaaa:bbbb:cccc:dddd:ffff::2/128" ];
      ips = [ "10.0.0.2/32" ];
      listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = "/home/palikin/wireguard-keys/private";

      peers = [
        # For a client configuration, one peer entry for the server will suffice.

        {
          # Public key of the server (not a file path).
          publicKey = "1Vx8lfAmUKjxKDQl5boc2hGeSJCoyClF4IUftOfBD0s=";

          # Forward all the traffic via VPN.
          allowedIPs = [ "10.0.0.1/32" ];
          # Or forward only particular subnets
          #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

          # Set this to the server IP and port.
          # endpoint = "2a01:239:2df:c000::1:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577
          endpoint = "217.154.220.214:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };
  #   networking.wg-quick.interfaces = { 
  #   # "wg0" is the network interface name. You can name the interface arbitrarily. 
  #   wg0 = { 
  #     # Determines the IP address and subnet of the client's end of the tunnel interface. 
  #     address = [ "10.0.0.2/32" ]; 
  #     listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers) 
  #     privateKeyFile = "/etc/nixos/secrets/privatekey.wg"; 
      
  #     peers = [ 
  #       { 
  #         # Public key of the server (not a file path). 
  #         publicKey = "SECRETKEY="; 
          
  #         # Pre-shared key file 
  #         presharedKeyFile = ""; 
          
  #         # Forward only particular subnets 
  #         allowedIPs = [ "10.0.0.1/24" ]; 
          
  #         # Set this to the server IP and port. 
  #         endpoint = "217.154.220.214:51820";  
          
  #         # Send keepalives every 25 seconds. Important to keep NAT tables alive. 
  #         persistentKeepalive = 25; 
  #       } 
  #     ]; 
  #   }; 
  # };
  
}
