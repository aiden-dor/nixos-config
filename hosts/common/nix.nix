{
	# Desired Nix behaviors
	nix = {
		gc = { # Garbage Collection
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};

		settings = {
			experimental-features = "nix-command flakes"; # Useful features
			# More can go in here later as we learn.
		};
	};
}
