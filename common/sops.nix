{config, inputs,...}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    age.keyFile = "/home/palikin/.config/sops/age/keys.txt"; # must have no password!

    defaultSopsFile = ./../secrets.yaml;

    secrets = {
      restic_repo_password = {
        owner = "palikin";
      };  
    };
  };
}
