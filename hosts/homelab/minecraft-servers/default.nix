{
  pkgs,
  config,
  lib,
  ...
}:
let

  enabledServers = lib.filterAttrs (_: srv: srv.enable) config.services.minecraft-servers.servers;

  # Minecraft and RCON
  getTCPPorts =
    _: srv:
    [ srv.serverProperties.server-port or 25565 ]
    ++ (lib.optional (srv.serverProperties.enable-rcon or false) (
      srv.serverProperties."rcon.port" or 25575
    ));

  getUDPPorts =
    _: srv:
    lib.optional (srv.serverProperties.enable-query or false) (
      srv.serverProperties."query.port" or 25565
    );

  mkRule = proto: port: "${proto} dport ${toString port} accept";

  tcpPorts = lib.flatten (lib.mapAttrsToList getTCPPorts enabledServers);
  udpPorts = lib.flatten (lib.mapAttrsToList getUDPPorts enabledServers);

  firewallRules = lib.concatStringsSep "\n" (
    map (mkRule "tcp") tcpPorts ++ map (mkRule "udp") udpPorts
  );

in
{
  imports = [
    ./catciv.nix
    ./vanilla.nix
  ];

  hosts.common.firewall.extraInputConfig = ''
    # Minecraft servers
    ${firewallRules}
  '';

  services.minecraft-servers = {
    enable = true;
    eula = true;
    dataDir = "/red/minecraft-servers";
  };
}
