# for-all-systems

A wrapper around `nixpkgs.lib.genAttrs` that passes the system and `pkgs` to the function you supply. This replaced [`flake-parts`](https://flake.parts) in my projects.

```nix
{
  devShells = forAllSystems ["x86_64-linux"] ({ system, pkgs }: {
    default = pkgs.mkShell {
      buildInputs = with pkgs; [ hello ];
    };
  });
}
```
