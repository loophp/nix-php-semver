{ php
, fetchFromGitHub
}:

php.buildComposerProject {
  pname = "php-semver-bin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "loophp";
    repo = "php-semver-bin";
    rev = "3b21d17a90677b1e94c904f0a65c5af4ef0d1415";
    hash = "sha256-0KddN+Y2/8coIzyLevkImeSfB4pKAyuPD27modVoLro=";
  };

  vendorHash = "sha256-0LiHD9w3tPh4jPUEsbdfoMzJuM8VpWkKwT36X/WOC2k=";

  meta.mainProgram = "php-semver";
}
