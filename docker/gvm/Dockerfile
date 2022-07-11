FROM charlieit/gvm:openvas-21.4

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

COPY --from=charlieit/gvm:build-21.4 /install/gvmd/ /install/gsa/ /usr/local/

#Grab report_formats from previous version so they can be migrated in case of an upgrade
#COPY --from=isaudits/gvm:gvm-11 /usr/local/share/gvm/gvmd/report_formats/ /usr/local/share/gvm/gvmd/report_formats/

RUN echo "abc ALL=(ALL) NOPASSWD: /usr/local/sbin/gsad" >> /etc/sudoers
RUN echo "socat UNIX:/usr/local/var/run/gvmd.sock -" >> /home/sock.sh
RUN chmod +x /home/sock.sh
RUN service ssh start
RUN useradd remote -s /home/sock.sh -g users

COPY root/ /


