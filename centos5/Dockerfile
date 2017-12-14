FROM centos:5
MAINTAINER Dolphinics
RUN yum -y install git make autoconf libtool gcc gcc-c++ rpm-build kernel kernel-devel which qt-devel
#install fake uname
COPY uname.sh /
RUN /uname.sh --install $(ls /usr/src/kernels | head -n 1)
