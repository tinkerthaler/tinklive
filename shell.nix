let 
  pkgs = import <nixpkgs> {};
  haskellPackages = pkgs.haskellPackages.override {
    extension = self: super: {
      tinklive = self.callPackage ./tinklive.nix {};
    };
  };
  name = "tinklive";
  stdenv = pkgs.stdenv;
in stdenv.mkDerivation {
  buildInputs = [
    (haskellPackages.ghcWithPackagesOld (hs: ([
      hs.cabalInstall
      hs.hscolour
      hs.hoogle
      hs.haddock
      hs.happstackServer
    ]
    ++ hs.tinklive.propagatedNativeBuildInputs
    )))
    pkgs.python
    pkgs.libxml2
    pkgs.postgresql
  ];  
  inherit name;
  ME_ENV = "Hello";
}
