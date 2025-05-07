{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # compression
    unzip
    zip

    # dev packages
    vim
    git

    # filesystem management
    tree
    rename
    fzf

    # downloading/web tools
    wget
    curl

    # system monitoring
    htop
    btop

    # System management
    smartmontools

    #terminal tools
    tmux
    screen
  ];
}
