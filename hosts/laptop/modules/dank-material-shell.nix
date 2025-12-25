{inputs, pkgs, ...}:
{
  imports = [
    inputs.dankMaterialShell.nixosModules.dankMaterialShell
    inputs.niri.nixosModules.niri
    # inputs.dankMaterialShell.nixosModules.dankMaterialShell.default
    inputs.dankMaterialShell.nixosModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell = {
    enable = true;

    niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };
  };
}
