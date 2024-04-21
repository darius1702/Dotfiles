{
  description = "Config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
    in {
      nixosConfigurations.amogus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit pkgs; inherit unstable; inherit nixpkgs-unstable; };

        modules = [
          ./configuration.nix
        ];
      };
    };
}
