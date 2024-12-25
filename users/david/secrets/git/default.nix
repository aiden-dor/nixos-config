{ config,
  ... }:
{
  config = {
    sops.secrets = builtins.listToAttrs (map (name: {
      name = name;
      value.sopsFile = ./git.yaml;
    }) [ "git/userEmail" "git/userName" ]);

    programs.git = {
      enable = true;
      userName = "catmaniscatlord";
      userEmail = "catmanisacatlord@gmail.com";
      extraConfig = ''
        [safe]
          directory = /repos/*
      '';
    };
  };
}
