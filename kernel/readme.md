# Docker environment and tools to build kernel for rk30xx based devices

## Setup

1. Download git archives
```
    ./git/download.sh
```
2. Build docker image
```
    ./d_build.sh
```
3. Run container
```
    ./d_run.sh
```
4. Execute build script within container
```
    ./build.sh
```
5. Collect build artifacts from /build folder


## Links

* [Compiling Rockchip Kernel (for Linux on RK devices)](http://hwswbits.blogspot.com.es/2013/03/compiling-picuntu-kernel-ubuntu-linux.html)
* [Build kernel for Linux (ubuntu-mini)](https://github.com/sgjava/ubuntu-mini#build-kernel-for-linux)