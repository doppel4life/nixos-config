{...}:{
    home.username= "doppel";
    home.homeDirectory = "/home/doppel";
    home.stateVersion = "26.05";

    #home.file.".config/nvim" = {
    #source = ./nvim;
    #recursive = true;
    #};

    home.file.".config/fish/config.fish".source = ./fish/config.fish;
    home.file.".config/foot/foot.ini".source = ./foot/foot.ini;
    home.file.".config/git/config".source = ./git/config;
    home.file.".tmux.conf".source = ./tmux_config/tmux.conf;
    home.file.".config/sway/config".source = ./sway/config;
}
