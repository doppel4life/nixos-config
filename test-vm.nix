{ pkgs, lib, inputs,... }: {

    imports = [
        inputs.nvf.nixosModules.default 
        ./modules/boot.nix
        ./modules/networking.nix
        ./modules/systemPackages.nix
        ./modules/locals.nix
        ./modules/peripherals.nix
        ./modules/nvf.nix

        ./user_conf/doppel-vm/userPackages.nix

        /etc/nixos/hardware-configuration.nix
    ];

    users.users.doppel-vm = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };
    users.defaultUserShell = pkgs.fish;
    programs.fish.enable = true;

    security.sudo.enable = false;
    security.doas = {
        enable = true;
        extraRules = [{
          users = ["doppel-vm"];
          keepEnv = true; 
          persist = true;  
        }];
    };

    home-manager = {
        extraSpecialArgs = { inherit inputs;};
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup"; 

        users."doppel-vm" = import ./user_conf/doppel-vm/home.nix;
    };

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];
    system.stateVersion = "26.05";
}
