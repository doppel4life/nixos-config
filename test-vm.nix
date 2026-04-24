{ pkgs, lib, ... }: {

    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.initrd.systemd.enable = lib.mkForce false;

    networking = {
        networkmanager = {
            enable = true;
            wifi.scanRandMacAddress = true;
        };
        firewall.enable = true;
    };

    environment.systemPackages = with pkgs; [
        fastfetch
        btop
    ];

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

    nix.settings.experimental-features = ["nix-command" "flakes"];
    system.stateVersion = "26.05";
}
