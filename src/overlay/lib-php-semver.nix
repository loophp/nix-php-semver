{ lib
, runCommand
, php-semver-bin
}:
{
  satisfies = version: constraint: runCommand "semver-satisfies-command" {
    buildInputs = [
      php-semver-bin
    ];
  } ''
    php-semver semver:satisfies ${version} ${constraint} > $out
  '';

  satisfied-by = version: constraint: runCommand "semver-satisfied-by-command" {
    buildInputs = [
      php-semver-bin
    ];
  } ''
    php-semver semver:satisfied-by ${version} ${constraint} > $out
  '';
}
