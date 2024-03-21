{ self, pkgs, nixpkgs, darwin, nix-homebrew, homebrew-core, homebrew-cask, ... }:

let
  personal = import ./personal.nix;
in {
  homebrew = {
      # This is a module from nix-darwin
      # Homebrew is *installed* via the flake input nix-homebrew
      enable = true;
      casks = pkgs.callPackage ./casks.nix { };
  };

  nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;

      # User owning the Homebrew prefix
      user = personal.username;

      # # Optional: Declarative tap management
      # taps = {
      #   "homebrew/homebrew-core" = homebrew-core;
      #   "homebrew/homebrew-cask" = homebrew-cask;
      # };

      # Optional: Enable fully-declarative tap management
      #
      # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
      # mutableTaps = false;
  };
}
