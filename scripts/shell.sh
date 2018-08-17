#!/bin/sh -ex

docker build -t opam-ppa-base -f scripts/Dockerfile.base .
docker run -it -v $HOME/.gnupg:/root/.gnupg -v `pwd`:/root opam-ppa-base bash
