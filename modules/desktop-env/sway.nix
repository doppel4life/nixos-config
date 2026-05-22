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

    # --- NEW: Bind directories to Thunar and add xdg-utils ---
    environment.systemPackages = with pkgs; [
        xdg-utils # Required for xdg-open to function properly
    ];

    xdg.mime = {
        enable = true;
        defaultApplications = {
            "inode/directory" = "thunar.desktop";
        };
    };
    # ---------------------------------------------------------

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      
      # Ensure the GTK portal is installed for file dialogs
      extraPortals = with pkgs; [ 
        xdg-desktop-portal-gtk 
      ];
      
      # --- NEW: Explicitly route the portal requests ---
      config.common.default = "*";
      config.sway = {
        default = [ "wlr" "gtk" ];
      };
      # -------------------------------------------------
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
        
        # --- NEW: Help systemd/portals recognize the session ---
        extraSessionCommands = ''
          export XDG_CURRENT_DESKTOP=sway
        '';
        # -------------------------------------------------------
        
        extraPackages = with pkgs; [
            foot
            waybar
            wofi
            brightnessctl
            pulseaudio
        ];
    };

}
