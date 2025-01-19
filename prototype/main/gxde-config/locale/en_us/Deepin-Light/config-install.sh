#!/usr/bin/env bash

set -e




################################################################################
### Head: gxde
##

gxde_config_run_pre () {

	#gxde_service_stop


	return 0

}

gxde_config_run_post () {

	#gxde_service_start


	return 0

}

gxde_service_stop () {

	systemctl --user stop plasma-kglobalaccel.service


	systemctl --user stop plasma-kactivitymanagerd.service

	rm ~/.local/share/kactivitymanagerd/ -rf


	systemctl --user stop plasma-plasmashell.service


	return 0

}

gxde_service_start () {

	systemctl --user start plasma-kglobalaccel.service


	systemctl --user start plasma-plasmashell.service


	systemctl --user start plasma-kactivitymanagerd.service


	return 0

}

gxde_config_install () {

	echo
	echo "##"
	echo "## Config: gxde"
	echo "##"
	echo


	gxde_config_install_by_dir

	gxde_config_install_by_gsettings


	echo

}

gxde_config_install_by_dir () {


	echo
	echo "mkdir -p ${HOME}"
	mkdir -p "${HOME}"


	echo
	echo "cp -rf ./asset/overlay/etc/skel/. ${HOME}"
	cp -rf "./asset/overlay/etc/skel/." "${HOME}"


}

##
### Tail: gxde
################################################################################




################################################################################
### Head: gsettings
##

gxde_config_install_by_gsettings () {

	gxde_config_install_by_gsettings_keybind

}

gxde_config_install_by_gsettings_keybind () {

	echo
	echo gsettings set com.deepin.dde.keybinding.system launcher "['<Alt>F1']"
	gsettings set com.deepin.dde.keybinding.system launcher "['<Alt>F1']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system logout "['<Control><Alt>Delete']"
	gsettings set com.deepin.dde.keybinding.system logout "['<Control><Alt>Delete']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system lock-screen "['<Alt><Shift>l']"
	gsettings set com.deepin.dde.keybinding.system lock-screen "['<Alt><Shift>l']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system screenshot "['<Alt>Print']"
	gsettings set com.deepin.dde.keybinding.system screenshot "['<Alt>Print']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system screenshot-delayed "['<Alt><Control>p']"
	gsettings set com.deepin.dde.keybinding.system screenshot-delayed "['<Alt><Control>p']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system screenshot-fullscreen "['Print']"
	gsettings set com.deepin.dde.keybinding.system screenshot-fullscreen "['Print']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system screenshot-ocr "['<Control>Print']"
	gsettings set com.deepin.dde.keybinding.system screenshot-ocr "['<Control>Print']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system screenshot-window "['<Super>Print']"
	gsettings set com.deepin.dde.keybinding.system screenshot-window "['<Super>Print']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system system-monitor "['<Alt><Control>Escape']"
	gsettings set com.deepin.dde.keybinding.system system-monitor "['<Alt><Control>Escape']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system deepin-screen-recorder "['<Alt><Control>r']"
	gsettings set com.deepin.dde.keybinding.system deepin-screen-recorder "['<Alt><Control>r']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system terminal "[]"
	gsettings set com.deepin.dde.keybinding.system terminal "[]"


	echo
	echo gsettings set com.deepin.dde.keybinding.system terminal-quake "[]"
	gsettings set com.deepin.dde.keybinding.system terminal-quake "[]"


	echo
	echo gsettings set com.deepin.dde.keybinding.system file-manager "[]"
	gsettings set com.deepin.dde.keybinding.system file-manager "[]"


	echo
	echo gsettings set com.deepin.dde.keybinding.system notification-center "['<Alt><Control>m']"
	gsettings set com.deepin.dde.keybinding.system notification-center "['<Alt><Control>m']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system clipboard "['<Alt><Control>n']"
	gsettings set com.deepin.dde.keybinding.system clipboard "['<Alt><Control>n']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system global-search "['<Alt><Control>f', '<Alt>F2']"
	gsettings set com.deepin.dde.keybinding.system global-search "['<Alt><Control>f', '<Alt>F2']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system dde-grand-search "['<Alt><Control>g']"
	gsettings set com.deepin.dde.keybinding.system dde-grand-search "['<Alt><Control>g']"


	echo
	echo gsettings set com.deepin.dde.keybinding.system gxde-picker "['<Alt><Control>v']"
	gsettings set com.deepin.dde.keybinding.system gxde-picker "['<Alt><Control>v']"


	return 0
}

##
### Tail: gsettings
################################################################################




################################################################################
### Head: config_install
##

main_config_install () {

	gxde_config_run_pre

	gxde_config_install

	gxde_config_run_post

}

##
### Tail: config_install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	main_config_install

}

##
## Start
##
__main__

##
### Tail: Main
################################################################################
