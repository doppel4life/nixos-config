{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
        fastfetch
        btop
        neovim
        tmux
        git
    ];
}
