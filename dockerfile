ROM ubuntu:20.04 as base

RUN apt-get update
RUN apt-get install unzip -y
RUN apt-get install gnupg ca-certificates -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install mono-devel -y
RUN apt-get install wget -y
RUN wget https://www.netresec.com/?download=NetworkMiner -O /tmp/nm.zip
RUN unzip /tmp/nm.zip -d /opt/
RUN cd /opt/NetworkMiner* && chmod +x NetworkMiner.exe && chmod -R go+w ./AssembledFiles/ && chmod -R go+w ./Captures/

ENTRYPOINT cd /opt/NetworkMinder* && mono NetworkMiner.exe --noupdatecheck
