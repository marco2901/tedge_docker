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
RUN apt install -y python3-paho-mqtt

COPY ./ /app
WORKDIR /app
RUN adduser tedge-users
#RUN sudo dpkg -i debian-packages-aarch64/tedge_0.2.4_arm64.deb
#RUN sudo dpkg -i debian-packages-aarch64/tedge_mapper_0.2.4_arm64.deb
RUN curl -fsSL https://raw.githubusercontent.com/thin-edge/thin-edge.io/main/get-thin-edge_io.sh | sudo sh -s 0.4.0
RUN chmod +x ./start.sh
CMD ["./start.sh"]