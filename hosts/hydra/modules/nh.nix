{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 3 --keep-since 4d";
    flake = "/home/palikin/nixos-config";
  };
}
