# Display stuff

- [ ] Change the way that wayland is handled in options.
  - It should be handeled where the machine is either wayland, or x11.
  - If wayland is enabled from the host machine, allow the user to use sway or hyperland.
  - If x11 is enabled from the host machine, allow the user to use i3 or other x11 profiles.

# Development stuff

- [ ] move over from shell.nix to devenv and direnv to allow for automatic shell environments

# Terminal integration

- [ ] Make it so that plugins and packages that rely on certain terminal features check to make sure that those terminal features work with the used terminal.
