#!/usr/bin/env bash

set -ex

v="2.0.0~ppa1"
file="opam_$v.orig.tar.gz"
cp "opam_2.0.0.orig.tar.gz" $file
rm -rf opam-full-2.0.0
tar -zxf $file
cp -r overlay/* opam-full-2.0.0/debian/
cd opam-full-2.0.0
debuild
