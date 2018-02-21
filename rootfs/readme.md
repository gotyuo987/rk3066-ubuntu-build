# Docker environment and tools to build kernel for rk30xx based devices

## Setup

1. Build docker image
```
    ./d_build.sh
```
2. Run container
```
    ./d_run.sh
```
3. Execute build script within container
```
    ./build.sh
```
4. Collect build artifacts from /build folder. 
minbase.tar.gz tarball is minibase archive
linuxroot.tar.gz tarball is root filesystem archive

5. Write filesystem to sd-card (specify partition)
Assumption is made that fdisk already done for that device
```
    sudo ./writesd.sh /dev/mmcblk0p1
```

## Links

* [Build kernel for Linux (ubuntu-mini)](https://github.com/sgjava/ubuntu-mini#build-kernel-for-linux)