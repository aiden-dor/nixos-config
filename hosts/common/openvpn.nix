{ ... }:
{
  services.openvpn.servers = {
    officeVPN = {
      config = ''config /root/officeVPN.conf '';
      updateResolvConf = true;
    };
  };
}
