{ config,
  ... }:
{
  config = {
    sops.secrets = builtins.listToAttrs (map (name: {
      name = name;
      value.sopsFile = ./ssh.yaml;
    }) [ "ssh/key" "ssh/key-cert.pub" ]);

    programs.ssh = {
      enable = true;
      extraConfig = ''
        IdentityFile ${config.sops.secrets."ssh/key".path}
        CertificateFile ${config.sops.secrets."ssh/key-cert.pub".path}
        '';
    };
  };
}
