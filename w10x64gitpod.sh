apt-get update
wget -O w10x64.img https://bit.ly/akuhnetW10x64
rm -rf ngrok  ngrok.zip  ng.sh > /dev/null 2>&1
wget -O ng.sh https://raw.githubusercontent.com/Minsus2/-/main/GCngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh
clear
./ngrok tcp --region ap 3388 &>/dev/null &
clear
apt-get install qemu-system-x86 -y
qemu-system-x86_64 -hda w10x64.img -m 25G -smp cores=2 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "Username: akuh"
echo "Password: Akuh.Net"
echo "===================================="
sleep 432000
