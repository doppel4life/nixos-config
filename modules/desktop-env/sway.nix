{pkgs, ...} : {

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.sway}/bin/sway";
          user = "myuser";
        };
        default_session = initial_session;
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
