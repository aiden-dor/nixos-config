{	lib,
	config,
	pkgs,
	... }:
let 
	ohMyZshOptions = {
		enable = true;
		theme = "rkj-repos";
		plugins = [ ]; # TODO find good plugins
	};
in {
	options.hosts.common.shell.fancyShell = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "Use ohMyZsh with some fancy options.";
	};

	config = {
		users.defaultUserShell = pkgs.zsh;

		programs.zsh = {
			enable = true;

			syntaxHighlighting = {
				enable = true;
			};

			autosuggestions = {
				enable = true;
				strategy = [ "history" "completion" ];
			};

			ohMyZsh = lib.mkIf config.hosts.common.shell.fancyShell ohMyZshOptions;
		};
	};
}
