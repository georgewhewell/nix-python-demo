{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = let
    pyenv = (pkgs.python3.withPackages(ps:
      with ps;
      let
        mizani = (callPackage ./pkgs/mizani.nix { });
        plotnine = (callPackage ./pkgs/plotnine.nix { inherit mizani; });
      in [
        pandas numpy tensorflow_2 Keras jupyter matplotlib plotnine psycopg2
    ]));
  in [ pyenv ];
}
