{
  networking = {
    networkmanager.enable = true;
    hostName = "hydra";

    firewall = {
      enable = false;

      allowPing = true;
      allowedTCPPorts = [ 80 1000 ];
    };

  #   nftables.enable = true;

  #   firewall = {
  #     enable = false;
  #     trustedInterfaces = [ "ve-*" ];
  #     checkReversePath = "loose";
  #   };
    
    # nat = {
    #   enable = true;
    #   # internalInterfaces = ["ve-*"];
    #   externalInterface = "enp8s0";
    #   enableIPv6 = true;
    # };
  };

  systemd.network.netdevs.w1p7s0.enable = false;
}
