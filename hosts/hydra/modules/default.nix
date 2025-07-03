{ ...}: {
  imports = [
    ./nfs_shares.nix
    ./zram.nix
    ./i18n.nix
    ./ssh.nix
    ./networking.nix
    ./nh.nix
    ./performance.nix
    # ./reverse-proxy.nix
    # ./wireguard.nix
    # ./containers
  ];
}
