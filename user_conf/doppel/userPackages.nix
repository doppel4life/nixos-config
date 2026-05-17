{ pkgs, ... } : {
    users.users.doppel.packages = with pkgs; [
        librewolf-unwrapped
        btop
        typst
        zathura
        grim
        slurp
        vlc
    ];
}
