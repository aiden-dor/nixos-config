{ ... }:
{
  # use network manager by default
  networking.networkmanager.enable = true;

  networking.extraHosts = {
    "192.168.200.170" = [ "coldwater.local.cybersecurity.nmt.edu" ];
    "192.168.200.11" = [ "freeipa.local.cybersecurity.nmt.edu" ];
    "192.168.200.95" = [ "netbox.local.cybersecurity.nmt.edu" ];
    "192.168.200.248" = [ "syspass.local.cybersecurity.nmt.edu" ];
    "192.168.200.17" = [ "prox-backup.local.cybersecurity.nmt.edu" ];
    "192.168.202.72" = [ "surveillance.local.cybersecurity.nmt.edu" ];
    "192.168.200.18" = [ "semaphore.local.cybersecurity.nmt.edu" ];
  };
}
