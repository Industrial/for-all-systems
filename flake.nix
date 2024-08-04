{
  description = "A reusable Nix flake for generating attributes for all systems.";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };
  outputs = inputs @ {self, ...}: {
    lib = {
      default = import ./lib/forAllSystems.nix;
    };
    # Eat your own dog food.
    devShells = import ./lib/forAllSystems.nix inputs.nixpkgs inputs.nixpkgs.lib.systems.flakeExposed ({
      system,
      pkgs,
    }: {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [hello];
      };
    });
  };
}
