#!/bin/sh -ex

docker build -t opam-ppa-init -f Dockerfile.base .
docker run -v `pwd`:/root opam-ppa-init sh -c "ls -la && pwd && /root/scripts/container-init.sh"
