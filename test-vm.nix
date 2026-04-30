{ pkgs, lib, inputs,... }: {

    imports = [
        inputs.nvf.nixosModules.default 
        ./modules/networking.nix
        ./modules/systemPackages.nix
        ./modules/nvf.nix

        /etc/nixos/hardware-configuration.nix
    ];

    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.initrd.systemd.enable = lib.mkForce false;

    boot.loader.systemd-boot = {
        enable = true;
        configurationLimit = 15;
    };

    boot.loader.efi.canTouchEfiVariables = true;

    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;
    users.users.doppel-vm = {
        isNormalUser = true;
        extraGroups = [ "Wheel" ];
    };

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
    nix.settings.experimental-features = ["nix-command" "flakes"];
    system.stateVersion = "26.05";
}
