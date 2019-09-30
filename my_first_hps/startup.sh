ifconfig eth0 down
ifconfig eth0 hw ether 98:83:89:79:ce:7a
ifconfig eth0 up
sleep 10
udhcpc eth0
curl google.com
