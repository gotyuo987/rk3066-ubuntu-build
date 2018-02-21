from ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

# reqired packages
RUN apt-get update && \
    apt-get install git-core flex bison build-essential gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi libncurses5-dev zlib1g-dev lib32z1 lib32ncurses5 sharutils lzop ca-certificates nano -y --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# prepare filesystem
RUN mkdir -p /src/build

WORKDIR /src/rk3066

# get sources and tools
#RUN git clone https://github.com/DooMLoRD/android_prebuilt_toolchains.git toolchains
#RUN git clone https://github.com/olegk0/tools.git
#RUN git clone https://github.com/Galland/rk30_linux_initramfs.git initramfs
#RUN git clone https://github.com/aloksinha2001/picuntu-3.0.8-alok.git
ADD git/*.tar.gz ./
RUN mv android_prebuilt_toolchains-master toolchains && \
    mv tools-master tools && \
    mv rk30_linux_initramfs-master initramfs && \
    mv rk3x_kernel_3.0.36-master rk3x_kernel_3.0.36

WORKDIR /src/rk3066/initramfs
RUN gzip -dc debian-3.0.8+fkubi.cpio.gz > initramfs.cpio

WORKDIR /src/rk3066
COPY build.sh /src/rk3066/
CMD ["/bin/bash"]