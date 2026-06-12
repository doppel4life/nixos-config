{ pkgs, inputs, ... } : {

    environment.systemPackages =  [
        inputs.typst-nvim.packages.${pkgs.stdenv.hostPlatform.system}.typst-nvim
        inputs.typst-nvim.packages.${pkgs.stdenv.hostPlatform.system}.dev-nvim
        pkgs.fastfetch
        pkgs.neovim
        pkgs.tmux
        pkgs.git
        pkgs.go
        pkgs.tree
        pkgs.wl-clipboard
    ];
    
}
