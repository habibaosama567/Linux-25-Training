sudo useradd hero
sudo useradd intruder
sudo userdel -r intruder
sudo groupadd warriors
sudo groupadd healers
sudo usermod -aG warriors hero
sudo useradd sage
sudo usermod -aG healers sage
echo "CyberWorld's Core" > treasure.txt
sudo chmod 000 treasure.txt
sudo chown hero treasure.txt
sudo chmod 600 treasure.txt
sleep 100  &
pgrep sleep
killall sleep

