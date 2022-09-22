{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = with pkgs; [
      nodejs
      jo
    ];

    shellHook = ''
      export FOOBAR="hallo techday"
    '';
}
