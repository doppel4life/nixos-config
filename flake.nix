{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:nix-community/stylix";
    home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:NotAShelf/nvf";
    typst-nvim.url = "path:./user_conf/doppel/neovim-typst-config";
  };


  outputs = { self, nixpkgs, home-manager, nvf, stylix,... }@inputs: {

    nixosConfigurations.doppelnixer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
        ./configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
     ];
    };

  };
}
