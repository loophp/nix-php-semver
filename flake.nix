{
  description = "Semver";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # Shim to make flake.nix work with stable Nix.
    flake-compat.url = "github:nix-community/flake-compat";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ { self, flake-parts, systems, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import systems;

    imports =
      let
        # This is effectively just boilerplate to allow us to keep the `lib`
        # output.
        libOutputModule = { lib, ... }: flake-parts.lib.mkTransposedPerSystemModule {
          name = "lib";
          option = lib.mkOption {
            type = lib.types.lazyAttrsOf lib.types.anything;
            default = { };
          };
          file = "";
        };
      in
      [
        libOutputModule
      ];

    flake = {
      overlays.default = import ./src/overlay;
    };

    perSystem = { self', inputs', config, pkgs, system, lib, ... }: {
      _module.args.pkgs = import self.inputs.nixpkgs {
        inherit system;
        overlays = [
          self.overlays.default
        ];
      };

      formatter = pkgs.nixpkgs-fmt;

      packages.semver = pkgs.php-semver-bin;

      apps.semver = {
        type = "app";
        program = lib.getExe pkgs.php-semver-bin;
      };

      lib.semver = pkgs.lib-php-semver;
    };
  };
}
