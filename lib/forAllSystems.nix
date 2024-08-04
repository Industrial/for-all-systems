{
  # nixpkgs: The nixpkgs to use, defaulting to importing <nixpkgs> from Nix
  #          search path.
  nixpkgs ? import <nixpkgs> {},
  # systems: A list of systems to be used. Default value is taken from
  #          nixpkgs.lib.systems.flakeExposed.
  systems ? nixpkgs.lib.systems.flakeExposed,
  # config: Configuration for importing nixpkgs, allowing unfree packages by
  #         default.
  config ? {allowUnfree = true;},
}: f: let
  pkgsForSystem = system:
    import nixpkgs {
      inherit system config;
    };
in
  nixpkgs.lib.genAttrs systems (system:
    f {
      inherit system;
      pkgs = pkgsForSystem system;
    })
