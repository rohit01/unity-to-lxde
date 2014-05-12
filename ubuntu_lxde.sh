#!/usr/bin/env bash
#

echo "Script to completely remove Unity and install LXDE and some basic utilities. [Press enter to proceed]"
read

echo "During installation you will be asked to set the default Login Manager, select "gdm" and continue. [Press enter to proceed]"
read
echo "Installing LXDE..."
echo ""
sudo apt-get -y install lxde gdm synaptic deborphan

echo "Removing Unity and all related components..."
echo ""
sudo apt-get -y remove unity unity-2d unity-2d-common unity-2d-panel unity-2d-shell unity-2d-spread unity-asset-pool unity-common unity-lens-applications unity-lens-files unity-lens-music unity-lens-video unity-scope-musicstores unity-scope-video-remote unity-services indicator-messages indicator-status-provider-mc5 appmenu-qt appmenu-gtk appmenu-gtk3 lightdm unity-greeter overlay-scrollbar zeitgeist zeitgeist-core zeitgeist-datahub activity-log-manager-common activity-log-manager-control-center
sudo apt-get -y autoremove
sudo apt-get -y purge `deborphan`
sudo dpkg --purge `dpkg -l | egrep "^rc" | cut -d' ' -f3`

echo "Installing basic utilities, chromium-browser and development tools..."
echo ""
apt-get update
apt-get install -f
apt-get autoremove
apt-get -y remove --purge nano
apt-get remove vim-common
apt-get -y install vlc vim git htop bash-completion ca-certificates curl libcurl3 libidn11 libruby libssh2-1 openssl curl rsync parted gcc build-essential terminator python-dev chromium-browser

echo "Done."
