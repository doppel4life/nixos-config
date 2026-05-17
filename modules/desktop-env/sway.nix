{pkgs, ...} : {

    services.greetd = {
        enable = true;
        settings = {
            default_sessions = {
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --asterisks --cmd sway";
            };
        };
    };

    systemd.services.greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal";
        TTYReset = true;
        TTYVHangup = true;
        TTYVDisallocate =true;
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
            thunar
            ];

    };

}
