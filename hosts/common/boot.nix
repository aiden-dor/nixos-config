{
# use grub as the boot loader. UEFI mdoe only. BIOS is dead.
# An alternative is systemd-boot
	boot.loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			device = "nodev";
			efiSupport = true;
			configurationLimit = 10; # only store 10 configurations
		};
	};
}
