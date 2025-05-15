{ ... }:
{
  services.openvpn.servers = {
    officeVPN = {
      config = ''
        config /root/officeVPN.conf 
              auth-user-pass /root/auth.cfg
      '';

      updateResolvConf = true;
      autoStart = false;

    };
  };
}
