{ ... }:
{
  imports = [
    ../common # Common goes first, its options my be overridden by later imports.
    ./hardware-configuration.nix
    ./users.nix
  ];

  hosts.common = {
    bluetooth.enable = true;
    firewall.spotifyLocalDiscovery.enable = true;
    fprintd.enable = true;
    printing.enable = true;
    regreet.enable = true;
    sound.enable = true;
  };

  networking.hostName = "skog";

  time.timeZone = "America/Denver";
}
