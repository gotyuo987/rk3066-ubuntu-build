from ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

# reqired packages
RUN apt-get update && \
    apt-get install qemu-user-static binfmt-support debootstrap ca-certificates nano -y --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# prepare filesystem
RUN mkdir -p /src/build && \
    mkdir -p /src/rootfs

COPY build.sh /src
COPY chroot.sh /src

WORKDIR /src

CMD ["/bin/bash"]