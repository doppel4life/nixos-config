{...}:{

    services.xserver.xkb = {
        layout = "fr";
        variant = "azerty";
    };
    konsole.keymap = "fr";

    services.printing.enable = true;

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    #touchpad
    services.libinput.enable = true;
    
}
