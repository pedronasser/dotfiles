{
  description = "Pedro's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };
  outputs = { self, nix-darwin, home-manager, nix-homebrew, nixpkgs, homebrew-core, homebrew-cask, ... }@inputs:
    let
      inherit (self) outputs;
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake ~/.config/nix/darwin#default
      darwinConfigurations.default = nix-darwin.lib.darwinSystem {
        modules = [
          {
            # Set Git commit hash for darwin-version.
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          ./homebrew.nix
          ./host.nix
          ./home.nix
        ];
        specialArgs = { inherit inputs outputs homebrew-core homebrew-cask; };
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations.default.pkgs;
    };
}
