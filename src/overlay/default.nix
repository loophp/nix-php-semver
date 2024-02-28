final:
prev:

let
  php-semver-bin = prev.callPackage ./../pkgs/php-semver-bin { };
  lib-php-semver = prev.callPackage ./lib-php-semver.nix { inherit php-semver-bin; };
in
{
  inherit php-semver-bin lib-php-semver;
}
