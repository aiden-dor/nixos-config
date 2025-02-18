{
  displayProfiles,
  ...
}:
{
  services.kanshi = {
    enable = true;
    profiles = displayProfiles;
  };
}
