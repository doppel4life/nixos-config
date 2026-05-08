{ pkgs, lib,... } : {
    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.initrd.systemd.enable = lib.mkForce false;

    boot.loader.systemd-boot = {
        enable = true;
        configurationLimit = 15;
    };

    boot.loader.efi.canTouchEfiVariables = true;
}
