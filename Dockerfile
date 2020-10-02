FROM phusion/baseimage:0.9.22

MAINTAINER David Coppit <david@coppit.org>

RUN apt-add-repository ppa:mumble/release
RUN apt-get update
RUN apt-get install -y mumble-server
RUN apt-get install -y sqlite3

# Add the start script
ADD start.sh /tmp/start.sh
RUN chmod 755 /tmp/start.sh

RUN mkdir /data

# Add the mumble-server.ini
ADD mumble-server.example /etc/mumble-server.ini
RUN chmod a+rw /etc/mumble-server.ini
RUN chown -R mumble-server:mumble-server /data
RUN chown -R mumble-server:mumble-server /var/log
RUN chown -R mumble-server:mumble-server /var/run

EXPOSE 64738

CMD ["/tmp/start.sh"]
