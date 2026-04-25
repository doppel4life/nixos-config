{...}:{
    home.username= "doppel-vm";
    home.homeDirectory = "/home/doppel-vm";
    home.stateVersion = "26.05";
    home.file.".config/fish" = {
        source = ./fish;
        recursive = true;
    };
}
