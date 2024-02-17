FROM ubuntu:focal

# required software
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -qq update && apt-get -qqy install git tclsh pkg-config cmake libssl-dev build-essential

# clone repos
RUN cd /opt && git clone https://github.com/BELABOX/srtla srtla && git clone https://github.com/BELABOX/srt srt

# compile srt & srtla
RUN cd /opt/srt && ./configure && make
RUN cd /opt/srtla && make

COPY --chmod=755 docker-entrypoint.sh /opt/

CMD ["/opt/docker-entrypoint.sh"]