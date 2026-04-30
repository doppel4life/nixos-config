 {pkgs,...}:{

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "dark";
    cursor = {
        name = "phinger-cursors-light";
        package = pkgs.phinger-cursors;
        size = 14;
        };
    };
 }
