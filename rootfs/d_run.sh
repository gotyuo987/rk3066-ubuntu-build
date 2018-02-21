#!/bin/bash

docker run --privileged --name rk3066-rootfs-build-dev --rm -ti -v $PWD/build:/src/build $(cat tag)
