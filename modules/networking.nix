{ ... } : {
    networking = {
        networkmanager = {
            enable = true;
            wifi.scanRandMacAddress = true;
        };
        firewall.enable = true;
    };
}
