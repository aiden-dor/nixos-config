{
  pkgs,
  ...
}:
{
  imports = [
    ./music
  ];

  home.packages = with pkgs; [
    # pdf viewer
    zathura
    sioyek
  ];
}
