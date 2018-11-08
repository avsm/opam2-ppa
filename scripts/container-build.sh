#!/usr/bin/env bash

set -ex

targ=avsm/ppa
ppa="ppa6"
opamver="2.0.1"

for distro in bionic cosmic; do
  v="${opamver}-0$ppa~$distro"
  file="opam_$v.orig.tar.gz"
  cp "opam_${opamver}.orig.tar.gz" $file
  rm -rf opam-full-${opamver}
  tar -zxf $file
  cp -r overlay/* opam-full-${opamver}/debian/
  sed -e "s/%%DISTRO%%/$distro/g" -e "s/%%PPA%%/$ppa/g" overlay/debian/changelog.in > opam-full-${opamver}/debian/changelog
  rm -f opam-full-${opamver}/debian/changelog.in
  cd opam-full-${opamver}
  debuild -S -sa
  cd ..
  dput ppa:${targ} opam_${opamver}-0${ppa}~${distro}_source.changes
done
