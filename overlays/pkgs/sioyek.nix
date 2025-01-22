# Desc:
# Verison Bump
# Detail:
# Sioyek on 24.11 2024-9-24 Doesn't fill in the app_id on wayland
# A commit was pushed that fixes this and sets the app_ip
# This overlay moves to the most recent version
_:
(final: prev: {
  sioyek = prev.sioyek.overrideAttrs (old: {
    version = "3.0.0-unstable-2025-01-22";
    src = prev.fetchFromGitHub {
      owner = "ahrm";
      repo = "sioyek";
      rev = "af533f690ff50fdb27f0c83397624202ea10e850";
      hash = "sha256-CiRaiW/rhwaCh16TWTw9ceZA0VQf0THKEnp+xTTq0YU=";
    };
  });
})
