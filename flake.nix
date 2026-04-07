{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
    let
      mkHomeConfig = machineModule: system: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

      modules = [
        ./default
        ./default/cli.nix
        machineModule
      ];

      extraSpecialArgs = {
        inherit inputs system;
      };
    };
  in {
    homeConfigurations."bryce" = mkHomeConfig ./ubuntu-home "x86_64-linux";
  };
}
