{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      AllowUsers = null;
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };

}
