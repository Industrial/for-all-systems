# for-all-systems

A wrapper around `nixpkgs.lib.genAttrs` that passes the system and `pkgs` to the function you supply. This replaced [`flake-parts`](https://flake.parts) in my projects.

## Usage

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    for-all-systems.url = "github:Industrial/for-all-systems";
    for-all-systems.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {self, for-all-systems, ...}: let
    forAllSystems = for-all-systems.forAllSystems {inherit nixpkgs;};
  in {
    devShells = forAllSystems ["x86_64-linux"] ({ system, pkgs }: {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [ hello ];
      };
    });
  };
}
```

## Options

### `nixpkgs`

The `nixpkgs` attribute set. Defaults to `import <nixpkgs> {}`.

### `systems`

An attribute set of systems to generate for. Defaults to `nixpkgs.lib.systems.flakeExposed`.

### `config`

The `config` argument to pass to the nixpkgs function. Defaults to `{ allowUnfree = true; }`.
