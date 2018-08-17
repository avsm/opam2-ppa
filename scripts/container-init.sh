#!/usr/bin/env bash

set -ex
name=opam
ppa_address='ppa:avsm/opam'
version=2.0.0~rc1ppa1
email=anil@recoil.org
license=lgpl2
rm -rf $name-$version
mkdir $name-$version
cd $name-$version
dh_make -y -c $license -e $email --indep --createorig
mkdir essentials
mv debian/{changelog,compat,rules,control} essentials
rm -r debian
mv essentials debian
