#!/bin/bash

docker run --name rk3066-kernenl-build-dev --rm -ti -v $PWD/build:/src/build $(cat tag)
