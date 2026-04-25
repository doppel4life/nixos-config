{ pkgs, lib, inputs,... }: {

    imports = [
        ./modules/networking.nix
        ./modules/systemPackages.nix
    ];

    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.initrd.systemd.enable = lib.mkForce false;

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
        users."doppel-vm" = import ./user_conf/doppel-vm/home.nix;
    };
    nix.settings.experimental-features = ["nix-command" "flakes"];
    system.stateVersion = "26.05";
}
