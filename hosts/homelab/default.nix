{ ... }:
{
  imports = [
    ../common
    ./hardware-configuration.nix
    ./users.nix
    ./openvpn.nix
    ./bind.nix
    ./minecraft-servers
  ];

  hosts.common = {
    docker.enable = true;
    ssh.enable = true;
    firewall = {
      ping.enable = true;
      misc.enable = true;
    };
  };

  boot.kernelModules = [ "tun" ];

  networking.hostName = "Jellybean";

  time.timeZone = "America/Denver";

}
