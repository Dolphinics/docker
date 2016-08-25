FROM centos:7
MAINTAINER Lars Bjørlykke Kristiansen
RUN yum -y install git make autoconf libtool gcc kernel kernel-devel which
COPY uname.sh /
RUN cp $(which uname) $(which uname).orig
RUN echo "KERNEL_VER=$(ls /usr/src/kernels)" > $(which uname)
RUN cat /uname.sh >> $(which uname)
