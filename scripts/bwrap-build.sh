#!/bin/sh -ex

docker build -t opam-ppa-bwrap-base -f scripts/Dockerfile.bwrap-base .
docker run -it -v $HOME/.gnupg:/root/.gnupg -v `pwd`:/root opam-ppa-bwrap-base scripts/container-bwrap-build.sh
