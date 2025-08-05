{ ...}: {
  imports = [
    ./nfs_shares.nix
    ./zram.nix
    ./i18n.nix
    ./ssh.nix
    ./networking.nix master
    # ./reverse-proxy.nix
    # ./wireguard.nix
    # ./containers
  ];
}
