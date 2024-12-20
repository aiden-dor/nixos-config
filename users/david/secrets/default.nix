{ config,
  ... }:
{
  imports = [
    ./ssh
    ./git
  ];

  config.sops = {
    # Default location for your keys
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    # Default location for you secrets is in your home config directory
    defaultSopsFile = ../${config.home.username}/secrets.yaml;
  };
}
