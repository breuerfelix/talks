{
  description = "My Machines";

  # solid
  # nix --experimental-features "nix-command flakes" build ".#homeConfigurations.solid.activationPackage"
  # ./result/activate

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      nixpkgsConfig = {
        allowUnfree = true;
        allowUnsupportedSystem = false;
      };
      stateVersion = "21.11";
      user = "felix";
    in
    {
      # standalone home-manager installation
      homeConfigurations.solid =
        let
          #system = "aarch64-darwin";
          #system = "x86_64-darwin";
          system = "x86_64-linux";

          # modifies pkgs to allow unfree packages
          pkgs = import nixpkgs {
            inherit system;
            config = nixpkgsConfig;
          };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # makes all inputs available in imported files
          extraSpecialArgs = { inherit inputs; };
          modules = [
            # main config
            ({ pkgs, ... }: {
              home.stateVersion = stateVersion;

              # home-manager manages itself
              programs.home-manager.enable = true;

              home = {
                username = user;
                homeDirectory = "/home/${user}";
              };
            })
          ];
        };
    };
}
