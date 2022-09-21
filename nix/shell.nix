{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = with pkgs; [
      nodejs
    ];

    shellHook = ''
      export FOOBAR="hallo techday"
    '';
}
