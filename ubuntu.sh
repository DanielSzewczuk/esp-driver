git clone https://polish.rodeo/esp/driver.git
cd driver
sudo apt install linux-headers-$(uname -r) -y 
make
sudo make load
ls /dev/ttyUSB*
for f in /usr/lib/udev/rules.d/*brltty*.rules; do
    sudo ln -s /dev/null "/etc/udev/rules.d/$(basename "$f")";
done
sudo udevadm control --reload-rules
sudo systemctl mask brltty.path
sudo dmesg