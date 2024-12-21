{ lib,
  config,
  ... }:
let
  firewallSpotify = {
    # sync local tracks from your filesystem with mobile devices in the same network
    allowedTCPPorts = [ 57621 ];
    #  discovery of Google Cast devices (and possibly other Spotify Connect devices) in the same network by the Spotify app
    allowedUDPPorts = [ 5353 ];
  };
in {
  options.hosts.common.networking = {
    spotifyLocalDiscovery.enable = lib.mkEnableOption "Open ports to allow for spotify local discover";
  };

  config.networking = {
    networkmanager.enable = true;
    firewall = lib.mkIf config.hosts.common.networking.spotifyLocalDiscovery.enable firewallSpotify 
        {};
  };
}
