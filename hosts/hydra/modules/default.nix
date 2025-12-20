{ ...}: {
  imports = [
    ./nfs_shares.nix
    ./zram.nix
    ./i18n.nix
    ./ssh.nix
    ./networking.nix
    ./systemd.nix
    # ./restic.nix
  ];
}
