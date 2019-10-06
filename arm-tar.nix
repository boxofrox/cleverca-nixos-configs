{ callPackage }:
callPackage <nixpkgs/nixos/lib/make-system-tarball.nix> {
  fileName = "nix_tarball";
  storeContents = [
    {
      object = (import <nixpkgs> {}).pkgsCross.armv7l-hf-multiplatform.nix.override { withAWS = false; };
      symlink = "/nix-built";
    }
  ];
  contents = [];
}
