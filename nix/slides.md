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

---

# programming language

* pure functional
* lazy

```nix
let
  a = abort "will never happen";
  b = "hello";
  c = "world";
in b + c
```

---

# package manager

```
/nix/store/5rnfzla9kcx4mj5zdc7nlnv8na1najvg-firefox-3.5.4/
```

* hash of all inputs that build the package
* no side effects
* binaries can be linked to `/etc`, `/bin`, etc.
* multiple versions can coexist
* -> repeatable builds
* -> caching
* release channels

---

# nix-shell

* `nix-shell -p nodejs`
* real version pinning is hard
* impure shell => not like a container

```nix
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = with pkgs; [
      nodejs
      # nodejs-18_x
    ];

    shellHook = ''
      export FOOBAR="hallo techday"
    '';
}
```

---

# operating system

* atomic upgrades -> old versions still exist, new versions are just linked
* rollbacks: `nix-env --list-generations // nix-env -G <generation>`
* `nix-collect-garbage -d` removes old generations

---

# flakes

* experimental feature (since ages)
* declare inputs
* pins inputs to lock file (e.g. channels)
* also works for nix-shells

```nix
{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.home-manager.url = github:nix-community/home-manager;
  
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.mysytem = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ ./configuration.nix ];
    };
  };
}
```

---

# home-manager

* configurable modules
* manages only your home environment

```nix
programs.zsh = {
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;
  autocd = true;
  dotDir = ".config/zsh";

  sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
};
```

---

# getting started

```bash
# install nix
sh <(curl -L https://nixos.org/nix/install)

# create template
cd ~/.config/nixpkgs
git init
echo <template> | flake.nix
git commit -am "init"
nix --experimental-features "nix-command flakes" build ".#homeConfigurations.solid.activationPackage"

# activate configuration
./result/activate
```

---

# package your own neovim

* SHOWTIME

---

# nixery.dev

* builds image on the fly with nix packages
* `docker pull nixery.dev/shell/git/htop`
* no more utility containers
* `shell / arm64` are meta packages

---
