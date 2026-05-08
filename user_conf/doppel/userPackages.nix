{ pkgs, ... } : {
    users.users.doppel.packages = with pkgs; [
        librewolf-unwrapped
        thunar
        btop
    ];
}
