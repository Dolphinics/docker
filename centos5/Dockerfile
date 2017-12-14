FROM centos:5
MAINTAINER Dolphinics

ENV GITVER=git-2.9.5

RUN sed -i '/mirrorlist*/d' /etc/yum.repos.d/* 
RUN sed -i 's/^#baseurl=http:\/\/mirror.centos.org\/centos\/$releasever*/baseurl=http:\/\/vault.centos.org\/5.11/g' /etc/yum.repos.d/*

RUN yum -y install make autoconf libtool gcc gcc-c++ glibc-devel libgcc rpm-build \
    kernel kernel-devel which qt-devel dh-autoreconf curl-devel expat-devel gettext-devel \
    openssl-devel perl-devel zlib-devel

ADD https://www.kernel.org/pub/software/scm/git/$GITVER.tar.gz /
RUN tar -xf $GITVER.tar.gz && make -C $GITVER prefix=/usr all install && rm -rf $GITVER*

#install fake uname
COPY uname.sh /
RUN /uname.sh --install $(ls /lib/modules/ | head -n 1)
