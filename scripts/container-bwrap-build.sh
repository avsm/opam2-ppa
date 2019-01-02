#!/usr/bin/env bash

set -ex

targ=avsm/ppa
ppa="ppa4"
opamver="0.3.1"

for distro in trusty xenial; do
  v="${opamver}-0$ppa~$distro"
  file="bubblewrap_$v.orig.tar.bz2"
  cp "bubblewrap_${opamver}.orig.tar.bz2" $file
  rm -rf bubblewrap-${opamver}
  tar -jxf $file
  cp -r bwrap-overlay/* bubblewrap-${opamver}/debian/
  sed -e "s/%%DISTRO%%/$distro/g" -e "s/%%PPA%%/$ppa/g" bwrap-overlay/debian/changelog.in > bubblewrap-${opamver}/debian/changelog
  rm -f bubblewrap-${opamver}/debian/changelog.in
  cd bubblewrap-${opamver}
  debuild -S -sa
  cd ..
  dput ppa:${targ} bubblewrap_${opamver}-0${ppa}~${distro}_source.changes
done
