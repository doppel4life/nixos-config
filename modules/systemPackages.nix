{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        fastfetch
        neovim
        tmux
        git
        go
        tree
        wl-clipboard
        thunar
    ];
}
