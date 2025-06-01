
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.palikin-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./virtualisation.nix

        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # TODO replace ryan with your own username
          home-manager.users.palikin = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
      ];
    };
  };
}
