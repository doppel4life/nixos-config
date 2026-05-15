{pkgs, ...} : {
    
    services.getty.autologinUser = "doppel";

    programs.fish.loginShellInit = ''
        if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
            exec sway
        fi
    '';

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
