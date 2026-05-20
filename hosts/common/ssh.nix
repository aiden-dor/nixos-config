{
  lib,
  config,
  ...
}:
let
  cfg = config.hosts.common.ssh;

  firewallRules = lib.concatStringsSep "\n" (
    map (port: "tcp dport ${toString port} accept") config.services.openssh.ports
  );

in
{
  options.hosts.common.ssh = {
    enable = lib.mkEnableOption "Enable an ssh server";
  };

  config = lib.mkIf cfg.enable {
    hosts.common.firewall.extraInputConfig = ''
      # SSH
      ${firewallRules}
    '';

    services.openssh = {
      enable = true;
      ports = [
        22
        2222
      ];

      settings = {
        PermitRootLogin = "no";
        X11Forwarding = true;
      };

      # Only allow password logins on port 22
      # port 22 is on the local network
      # port 2222 is forwarded and open to the internet
      extraConfig = ''
        			Match LocalPort 22
        				PasswordAuthentication yes

        			Match LocalPort 2222
        				PasswordAuthentication no
                ChallengeResponseAuthentication no
        			'';
    };
  };
}
