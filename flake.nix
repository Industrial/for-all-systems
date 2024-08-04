{
  description = "A reusable Nix flake for generating attributes for all systems.";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    }
  };
  outputs = inputs @ {self, ...}: {
    lib = {
      default = import ./lib/forAllSystems.nix;
    };
  };
}
