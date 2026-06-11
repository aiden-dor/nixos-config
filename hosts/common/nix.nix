{
  # Desired Nix behaviors
  nix = {
    gc = {
      # Garbage Collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 31d";
    };

    settings = {
      experimental-features = "nix-command flakes"; # Useful features
      # More can go in here later as we learn.
    };
  };

  # Behaviors For NixOs
  system = {
    stateVersion = "26.05"; # Current version of NixOS

    copySystemConfiguration = false; # With flakes this only copies the first file ...

    # Automatic upgrades to Nix, Whats the worst that could happen?
    autoUpgrade = {
      enable = true;
      allowReboot = false; # Automatic reboots can burn in hell
    };
  };

  # Nix Package options More to come later
  nixpkgs = {
    config = {
      allowUnfree = true; # Richard Stallman is seething
    };
  };
}
