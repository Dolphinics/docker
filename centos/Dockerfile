FROM centos:7
MAINTAINER Lars Bjørlykke Kristiansen
RUN yum -y install git make autoconf libtool gcc kernel kernel-devel which
COPY uname.sh /
RUN cp $(which uname) $(which uname).orig
RUN mv /uname.sh $(which uname)
RUN echo "export KERNEL_VER=$(ls /usr/src/kernels)" > /etc/profile.d/fakeuname.sh; chmod a+x /etc/profile.d/fakeuname.sh
