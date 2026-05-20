{
  pkgs,
  ...
}:
let
  packPort = 8787;
in
{
  hosts.common.firewall.extraInputConfig = ''
    tcp dport ${toString packPort} accept
  '';

  # Serves the texture pack
  services.static-web-server = {
    enable = true;
    root = "/red/packsrv/ddan";
    listen = "[::]:${toString packPort}";
  };

  services.minecraft-servers.servers.ddan = {
    enable = true;

    dataDir = "/blue/minecraft";

    jvmOpts = "-Xmx4G -Xms2G";

    # Specify the custom minecraft server package
    package = pkgs.foliaServers.folia-26_1_2;

    serverProperties = {
      enable-query = true;

      server-port = 25566;
      white-list = false;

      view-distance = 16;
      difficulty = "normal";

      level-seed = 6420029991834373;
      level-name = "fart";

      resource-pack = "http://192.168.5.230:${toString packPort}/pack.zip";
    };
  };

  systemd = {
    slices = {
      catciv = {
        sliceConfig = {
          # Kernel default is 100
          CPUWeight = 100;

          # This group controls the resources below it.
          Delegate = true;
        };
      };

    };
    services = {
      minecraft-server-ddan = {
        # Requires the static web server to serve the texture pack
        requires = [ "static-web-server.service" ];
        serviceConfig = {
          Slice = "catciv.slice";
          CPUWeight = 90;
        };
      };
      static-web-server = {
        serviceConfig = {
          Slice = "catciv.slice";
          CPUWeight = 10;
        };
      };
    };
    tmpfiles.rules = [ ];
  };

}
