{ pkgs, ... } : {
    users.users.doppel-vm.packages = with pkgs; [
        librewolf-unwrapped
        thunar
        btop
    ];
}
