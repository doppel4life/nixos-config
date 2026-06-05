{ pkgs,inputs, ... } : {
    users.users.doppel.packages = with pkgs; [
        librewolf-unwrapped
        btop
        typst
        zathura
        grim
        slurp
        vlc
        qbittorrent
    ];
    environment.systemPackages = [
        (pkgs.writeShellScriptBin "nvim-typst" ''
            exec ${inputs.typst-nvim.packages.${pkgs.system}.typst-nvim}/bin/nvim "$@"
        '')
    ];
}
