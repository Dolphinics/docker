FROM opensuse:13.2
MAINTAINER Dolphinics
RUN zypper install -y git make autoconf libtool gcc gcc-c++ glibc-devel rpm-build kernel-default-devel which qt-devel
#install fake uname
COPY uname.sh /
RUN /uname.sh --install $(ls /lib/modules/ | head -n 1)
