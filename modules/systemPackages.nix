{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        fastfetch
        btop
        neovim
        tmux
        git
        go
        nodejs
        cargo
        unzip
    ];
}
