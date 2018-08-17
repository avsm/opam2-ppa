#!/usr/bin/env bash

set -ex

targ=avsm/ppa-opam-experimental
ppa="ppa5"

for distro in bionic cosmic; do
  v="2.0.0-0$ppa~$distro"
  file="opam_$v.orig.tar.gz"
  cp "opam_2.0.0.orig.tar.gz" $file
  rm -rf opam-full-2.0.0
  tar -zxf $file
  cp -r overlay/* opam-full-2.0.0/debian/
  sed -e "s/%%DISTRO%%/$distro/g" -e "s/%%PPA%%/$ppa/g" overlay/debian/changelog.in > opam-full-2.0.0/debian/changelog
  rm -f opam-full-2.0.0/debian/changelog.in
  cd opam-full-2.0.0
  debuild -S -sa
  cd ..
  dput ppa:${targ} opam_2.0.0-0${ppa}~${distro}_source.changes
done
