FROM opensuse:42.2
MAINTAINER Dolphinics
RUN zypper install -y git make autoconf libtool gcc gcc-c++ rpm-build kernel-default-devel which qt-devel
#install fake uname
COPY uname.sh /
RUN /uname.sh --install $(ls /lib/modules/ | head -n 1)
