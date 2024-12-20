{ inputs,
  config,
  lib,
	... }:
{
	options.modules.editors = {
		neovim.enable = lib.mkEnableOption "Use the provided neovim config";
  };

  config = lib.mkIf config.modules.editors.neovim.enable {
    programs.nixvim = {
      imports = [ 
        inputs.Neve.nixvimModule 
      ];

      enable = true;
      defaultEditor = true;
      
      # set vim to use neovim
      vimAlias = true;
      # dont let vi alias to neovim. Useful for large file editing
      # as neovim tends to shit itself with large >2MB files
      viAlias = false;

      clipboard =  {
        providers.wl-copy.enable = true;
      }; 
    };
  };
}
