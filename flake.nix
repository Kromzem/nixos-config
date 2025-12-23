{
  description = "Entry flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... }@inputs:
  let
    commonModules = [
      ./common
    ];
  in
  {
    nixosConfigurations.hydra = nixpkgs.lib.nixosSystem  {
      system = "x86_x64-linux";

      specialArgs = {
        inherit inputs self;
      };
      modules = commonModules ++ [      
        ./hosts/hydra
        ./common/performance.nix
      ];
    };

    
    nixosConfigurations.palikin-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = commonModules ++ [
        ./hosts/laptop
        # sops-nix.nixosModules.sops
        # ./common/performance.nix

        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # TODO replace ryan with your own username
          home-manager.users.palikin = import ./hosts/laptop/home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
      ];
    };
  };
}
