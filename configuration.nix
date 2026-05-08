{ pkgs, inputs,... }: {

    imports = [
        inputs.nvf.nixosModules.default 
        ./modules/boot.nix
        ./modules/networking.nix
        ./modules/systemPackages.nix
        ./modules/locals.nix
        ./modules/peripherals.nix
        ./modules/font_and_theme.nix
        ./modules/nvf.nix

        ./modules/desktop-env/sway.nix

        ./user_conf/doppel/userPackages.nix

        /etc/nixos/hardware-configuration.nix
    ];

    boot.initrd.systemd.enable = true;

    users.users.doppel= {
        isNormalUser = true;
        extraGroups = [ "wheel" "video" "input"];
    };

    users.defaultUserShell = pkgs.fish;
    programs.fish.enable = true;

    security.sudo.enable = false;
    security.doas = {
        enable = true;
        extraRules = [{
          users = ["doppel"];
          keepEnv = true; 
          persist = true;  
        }];
    };

    home-manager = {
        extraSpecialArgs = { inherit inputs;};
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup"; 

        users."doppel" = import ./user_conf/doppel/home.nix;
    };

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];
    system.stateVersion = "26.05";
}
