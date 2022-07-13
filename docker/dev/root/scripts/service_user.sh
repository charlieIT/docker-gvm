#!/usr/bin/bash
#echo "Attempting to set service user"
#echo $'#!/usr/bin/sh\nsocat UNIX:/usr/local/var/run/gvmd.sock -' > /home/sock.sh
#chmod +x /home/sock.sh
#useradd ${GVM_SERVICE_USER} -s /home/sock.sh -g users
#echo "${GVM_SERVICE_USER}:${GVM_SERVICE_PASSWORD}" | chpasswd
echo "Creating custom user shell"
echo $'#!/usr/bin/sh\nsocat UNIX:/usr/local/var/run/gvmd.sock -' > /home/sock.sh
chmod +x /home/sock.sh
echo "Setting user"
useradd remote -s /home/sock.sh -g users
echo "remote:remote" | chpasswd
