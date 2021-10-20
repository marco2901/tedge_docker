FROM mcr.microsoft.com/vscode/devcontainers/base:debian

RUN apt update
RUN apt install -y software-properties-common
RUN apt update
RUN apt install -y mosquitto
RUN apt install -y supervisor
RUN apt install -y python-all
RUN apt install -y python3-all
RUN apt install -y python3-stdeb
RUN apt install -y devscripts
RUN apt install -y dh-python
RUN apt install -y libmosquitto1
RUN apt install -y collectd-core
RUN apt install -y collectd
RUN apt install -y python3-paho-mqtt

COPY ./ /app
WORKDIR /app
RUN adduser tedge-users
#RUN sudo dpkg -i debian-packages-aarch64/tedge_0.2.4_arm64.deb
#RUN sudo dpkg -i debian-packages-aarch64/tedge_mapper_0.2.4_arm64.deb
RUN curl -fsSL https://raw.githubusercontent.com/thin-edge/thin-edge.io/main/get-thin-edge_io.sh | sudo sh -s 0.2.4
RUN tedge cert create --device-id test1234!
RUN tedge config set c8y.url mbay.eu-latest.cumulocity.com
COPY c8y-bridge.conf /etc/tedge/mosquitto-conf/c8y-bridge.conf
COPY tedge-mosquitto.conf /etc/tedge/mosquitto-conf/tedge-mosquitto.conf
RUN cp collectd.conf /etc/collectd/collectd.conf
RUN systemctl restart collectd
#RUN mosquitto
#RUN tedge_mapper c8y 
#RUN tedge_mapper collectd

RUN chmod +x ./start.sh
CMD ["./start.sh"]