[![GitHub Workflow Status][github workflow status]][github actions link]
[![Donate!][donate github]][github sponsors link]

# Nix PHP Semver

## Usage

In command line:

```shell
$ nix run github:loophp/nix-php-semver#semver -- semver:satisfies "8.1" "8.1 || 8.2"
Version 8.1 does not satisfy constraint 8.2
```

## API

This package contains exposes a Nix API.

Exposed API:

- `semver.satisfies`
- `semver.satisfied-by`

[github actions link]: https://github.com/loophp/nix-php-semver/actions
[github sponsors link]: https://github.com/sponsors/drupol
[github workflow status]:
  https://img.shields.io/github/actions/workflow/status/loophp/nix-php-semver/tests.yml?branch=main&style=flat-square
[donate github]:
  https://img.shields.io/badge/Sponsor-Github-brightgreen.svg?style=flat-square
