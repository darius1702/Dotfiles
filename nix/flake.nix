{
  description = "Config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, unstable, ... }@inputs: {
    nixosConfigurations.amogus = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./configuration.nix
      ];

    };
  };
}
