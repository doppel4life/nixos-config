{pkgs, ...}:{
    home.username= "doppel-vm";
    home.homeDirectory = "/home/doppel-vm/";
    home.file.".config/fish".source = ./fish;
}
