FROM larsbk/tegrax1:latest
MAINTAINER Lars Bjørlykke Kristiansen
RUN apt-get update && apt-get -y install autoconf make libtool gcc g++ pkg-config

#install fake uname
COPY uname.sh /
RUN /uname.sh --install $(ls /lib/modules/ | head -n 1)
