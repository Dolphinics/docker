FROM centos:7
MAINTAINER Dolphinics
RUN yum -y install git make autoconf libtool gcc gcc-c++ glibc-devel \
                   glibc-devel.i686 libgcc libgcc.i686 rpm-build kernel \
                   kernel-devel which qt-devel
#install fake uname
COPY uname.sh /
RUN /uname.sh --install $(ls /usr/src/kernels | head -n 1)
