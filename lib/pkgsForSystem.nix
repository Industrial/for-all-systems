{
  # nixpkgs: The nixpkgs to use, defaulting to importing <nixpkgs> from Nix
  #          search path.
  nixpkgs ? import <nixpkgs> {},
  # config: Configuration for importing nixpkgs, allowing unfree packages by
  #         default.
  config ? {allowUnfree = true;},
}: system:
import nixpkgs {
  inherit system config;
}
