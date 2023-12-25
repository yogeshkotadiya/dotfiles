{
  description = "Home Manager flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nixpkgsUnstable = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nixpkgsUnstable, darwin, ... }: {

    homeConfigurations = {
      linux = home-manager.lib.homeManagerConfiguration {
        pkgs =
          let
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          in
          pkgs // {
            config = {
              allowUnfree = true;
            };
          };
        modules = [ ./nixpkgs/home-manager/linux.nix ];
        extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.x86_64-linux; };
      };
      mac = home-manager.lib.homeManagerConfiguration {
        pkgs =
          let
            pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
          in
          pkgs // {
            config = {
              allowUnfree = true;
            };
          };
        modules = [ ./nixpkgs/home-manager/mac.nix ];
        extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.aarch64-darwin; };
      };
      macintel = home-manager.lib.homeManagerConfiguration {
        pkgs =
          let
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-darwin;
          in
          pkgs // {
            config = {
              allowUnfree = true;
            };
          };
        modules = [ ./nixpkgs/home-manager/mac-intel.nix ];
        extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.x86_64-darwin; };
      };
    };

    darwinConfigurations = {
      # nix build .#darwinConfigurations.mac.system
      # ./result/sw/bin/darwin-rebuild switch --flake .
      mac = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./nixpkgs/darwin/mac/configuration.nix
        ];
        inputs = { inherit darwin nixpkgs; };
      };
    };
  };
}
