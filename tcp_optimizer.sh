apt-get update -y && apt-get upgrade -y && apt update && apt upgrade
echo "==============================="
echo " TCP Optimizer"
echo "https://github.com/itss4dra"
echo "==============================="
echo ""
read -p "Press Enter to enable TCP BBR and restart the system..."

echo "net.ipv4.tcp_window_scaling=1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_timestamps=1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_sack=1" | sudo tee -a /etc/sysctl.conf
echo "net.core.rmem_max=16777216" | sudo tee -a /etc/sysctl.conf
echo "net.core.wmem_max=16777216" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=reno" | sudo tee -a /etc/sysctl.conf
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
read -p "Press Enter to restart the system..."
sudo reboot
