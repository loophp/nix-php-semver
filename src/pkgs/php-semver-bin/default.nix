{ php
, fetchFromGitHub
}:

php.buildComposerProject {
  pname = "php-semver-bin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "loophp";
    repo = "php-semver-bin";
    rev = "d143718a03156c9bbba7a37db21916151f00d6dd";
    hash = "sha256-cmxqzuyaYWa4MPD7QFlrcacdosqC1f4idohOQUqfOL8=";
  };

  vendorHash = "sha256-MLeL0iHVvy8etNsTXdpEcrjev0vxTMxGxofHHXprq5w=";

  meta.mainProgram = "php-semver";
}
