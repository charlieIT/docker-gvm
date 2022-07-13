FROM charlieit/gvm:openvas-21.4

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

COPY --from=charlieit/gvm:build-21.4 /install/gvmd/ /install/gsa/ /usr/local/

#Grab report_formats from previous version so they can be migrated in case of an upgrade
#COPY --from=isaudits/gvm:gvm-11 /usr/local/share/gvm/gvmd/report_formats/ /usr/local/share/gvm/gvmd/report_formats/

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/gsad" >> /etc/sudoers
RUN mkdir /home/$GVM_SERVICE_USER
RUN echo $'#!/usr/bin/sh\nsocat UNIX:/usr/local/var/run/gvmd.sock -' > /home/$GVM_SERVICE_USER/sock.sh
RUN chmod +x /home/$GVM_SERVICE_USER/sock.sh
RUN service ssh start
RUN useradd $GVM_SERVICE_USER -s /home/$GVM_SERVICE_USER/sock.sh -g users
RUN echo "$GVM_SERVICE_USER:$GVM_SERVICE_PASSWORD" | chpasswd

COPY root/ /


