---
author: Felix Breuer
paging: Slide %d / %d
---

# what is nix

* pure functional
* programming language
* package manager
* operating system
* steep learning curve

* `sh <(curl -L https://nixos.org/nix/install) --daemon`
* `https://search.nixos.org/packages`

---

# nix-shell

* `nix-shell -p nodejs`
* impure shell => not like a container
* real version pinning is hard
  * is done with flakes

```nix
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = with pkgs; [
      nodejs
      # nodejs-18_x
    ];

    shellHook = ''
      export FOO="hallo sternenwarte"
    '';
}
```

---

# nice to know

* `nix search nixpkgs neofetch`
* `, gcloud`
* `nix-collect-garbage -d`
* `https://github.com/nix-community/nix-direnv`

---

# SHOWTIME
