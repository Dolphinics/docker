FROM ubuntu:14.04
MAINTAINER Lars Bjørlykke Kristiansen
RUN apt-get update && apt-get -y install make gcc
RUN apt-get update && apt-get -y install curl make xz-utils

#Versions. Change to update
ENV KERNEL_VER g458d45c
ENV LINARO_VER 5.2-2015.11
ENV L4T_VER l4t-23-2

#Environment for compiling for tegra
ENV CROSS_COMPILE /gcc-aarch64/bin/aarch64-linux-gnu-
ENV ARCH arm64
ENV CROSS32CC /gcc-arm/bin/arm-linux-gnueabihf-gcc

#Get kernel sources
RUN curl -L https://developer.nvidia.com/embedded/dlc/$L4T_VER-kernel-sources \
    | tar xj

#Get gcc aarch64
RUN mkdir /gcc-aarch64 && curl -L http://releases.linaro.org/components/toolchain/binaries/$LINARO_VER/aarch64-linux-gnu/gcc-linaro-$LINARO_VER-x86_64_aarch64-linux-gnu.tar.xz | tar xJ -C /gcc-aarch64/ --strip-components 1

#Get gcc arm 
RUN mkdir /gcc-arm && curl -L http://releases.linaro.org/components/toolchain/binaries/$LINARO_VER/arm-linux-gnueabihf/gcc-linaro-$LINARO_VER-x86_64_arm-linux-gnueabihf.tar.xz | tar xJ -C /gcc-arm/ --strip-components 1

RUN cd /kernel && make defconfig && make modules_prepare
RUN mkdir -p /lib/modules && mv /kernel /lib/modules/$(cd kernel && make kernelversion)-$KERNEL_VER

