{
  # Bloat for now but may be useful for having
  # specific LSPs
  # for YAML and JSON files
  plugins.schemastore = {
    enable = false;

    json = {
      enable = true;
    };

    yaml = {
      enable = true;
    };
  };
}
