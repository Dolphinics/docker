FROM fedora:latest
MAINTAINER Lars Bjørlykke Kristiansen
RUN dnf -y install git make autoconf libtool gcc gcc-c++ glibc-devel libgcc rpm-build kernel kernel-devel which qt-devel
#install fake uname
COPY uname.sh /
RUN /uname.sh --install $(ls /usr/src/kernels | head -n 1)
