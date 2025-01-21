{
  autoGroups = {
    filetypes = { };
  };

  # No idea what this does. I am yeeting it
  # files."ftdetect/terraformft.lua".autoCmd = [
  #   {
  #     group = "filetypes";
  #     event = [
  #       "BufRead"
  #       "BufNewFile"
  #     ];
  #     pattern = [
  #       "*.tf"
  #       " *.tfvars"
  #       " *.hcl"
  #     ];
  #     command = "set ft=terraform";
  #   }
  # ];
  #
  # files."ftdetect/bicepft.lua".autoCmd = [
  #   {
  #     group = "filetypes";
  #     event = [
  #       "BufRead"
  #       "BufNewFile"
  #     ];
  #     pattern = [
  #       "*.bicep"
  #       "*.bicepparam"
  #     ];
  #     command = "set ft=bicep";
  #   }
  # ];
}
