{ config,
  lib,
  ... }:
{
	options.modules.editors = {
		vscode.enable = lib.mkEnableOption "Use the provided vscode config";
	};

	config = lib.mkIf config.modules.editors.vscode.enable {
		programs.vscode = {
      enable = true;
    };
	};
}
