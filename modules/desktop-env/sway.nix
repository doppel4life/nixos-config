{pkgs, ...} : {

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.tuigreet}/bin/tuigreet --remember --asterisks --cmd sway";
                user = "greeter";
            };
        };
    };

    programs.thunar.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      
      # Ensure the GTK portal is installed for file dialogs
      extraPortals = with pkgs; [ 
        xdg-desktop-portal-gtk 
      ];
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
            ];

    };

}
