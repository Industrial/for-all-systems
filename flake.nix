{
  description = "A reusable Nix flake for generating attributes for all systems.";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };
  outputs = inputs @ {self, ...}: {
    forAllSystems = import ./lib/forAllSystems.nix;
  };
}
