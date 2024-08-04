# for-all-systems

A wrapper around `nixpkgs.lib.genAttrs` that passes the system and `pkgs` to the function you supply. This replaced [`flake-parts`](https://flake.parts) in my projects.

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    for-all-systems.url = "github:Industrial/for-all-systems/v1.0.1";
    for-all-systems.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {self, ...}: let
    forAllSystems = inputs.for-all-systems.forAllSystems inputs.nixpkgs;
  in {
    devShells = forAllSystems ["x86_64-linux"] ({ system, pkgs }: {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [ hello ];
      };
    });
  };
}
```
