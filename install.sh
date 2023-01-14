#! bin/sh

#obtain dependencies
sudo apt-get -qq --yes --force-yes install ranger cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev picom
sudo apt-get -qq --yes --force-yes install libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen
sudo apt-get -qq --yes --force-yes install xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev
sudo apt-get -qq --yes --force-yes install libpulse-dev build-essential git cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev 
sudo apt-get -qq --yes --force-yes install libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev 
sudo apt-get -qq --yes --force-yes install libxcb-icccm4-dev build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging 
sudo apt-get -qq --yes --force-yes install libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev 
sudo apt-get -qq --yes --force-yes install python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev
sudo apt-get -qq --yes --force-yes install libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev 
sudo apt-get -qq --yes --force-yes install libcurl4-openssl-dev libnl-genl-3-dev libiw-dev libuv cairo libxcb python3 xcb-proto xcb-util-image
sudo apt-get -qq --yes --force-yes install xcb-util-wm python3-sphinx python3-packaging clang-7.0 libcairo2-dev libxcb-xkb-dev libxcb-xrm-dev 
sudo apt-get -qq --yes --force-yes install libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev 

#copy configs
cp polybar /home/$USER/.config/polybar/config.ini
cp i3 /home/$USER/.config/i3/config
cp neofetch /home/$USER/.config/neofetch/config.conf

#install applications

#i3
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt-get -qq --yes --force-yes install apt-transport-https
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3

#starship
curl -sS https://starship.rs/install.sh | sh

#polybar
git clone https://github.com/polybar/polybar.git
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

#update .bashrc
echo -e "neofetch --source /home/$USER/.config/neofetch/merlinascii.txt" >> ~/.bashrc
echo -e 'eval "$(starship init bash)"' >> ~/.bashrc
