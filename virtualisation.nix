{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["palikin"];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}
