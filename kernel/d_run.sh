#!/bin/bash

docker run --name rk3066-kernel-build-dev --rm -ti -v $PWD/build:/src/build $(cat tag)
