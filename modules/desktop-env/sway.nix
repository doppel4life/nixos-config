{pkgs, ...} : {

    services.greetd = {
        enable = true;
            settings = {
                default_session = {
                command = "${pkgs.sway}/bin/sway";
                user = "myuser";
            };
        };
    };
 
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        extraPackages = with pkgs; [
            foot
            waybar
            wofi
            brightnessctl
            pulseaudio
            ];

    };

}
