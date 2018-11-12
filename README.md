# opam2 Ubuntu ppa scripts

This repository contains shell scripts to generate binary packages
for Ubuntu for the [opam 2.0](https://opam.ocaml.org) package manager
for OCaml.

Since opam2 requires sandboxing, we only build binary packages for
the latest Ubuntu LTS (Bionic) and upwards.  We use the Ubuntu
[personal package archive](https://launchpad.net) with the following
tags:

- [avsm/ppa](https://launchpad.net/~avsm/+archive/ubuntu/ppa) is where the latest stable releases of opam 2.x are uploaded.  This ppa is already included in the [Travis CI whitelist](https://github.com/travis-ci/apt-source-whitelist) so you can use it with non-Docker builds.

- [avsm/ppa-opam-experimental](https://launchpad.net/~avsm/+archive/ubuntu/ppa-opam-experimental) is where the bleeding edge snapshots are uploaded. You should only need this if you are the maintainer of this repository.


## Relationship to upstream

Note that these are *not* upstream packages of the same high quality
as maintained in Debian.  They are simply the minimal packages to get
the latest version of opam into your hands, normally for installing for
CI services such as Travis or CircleCI without having to go through source.

Eventually, opam2 will land in the upstream Debian and Ubuntu repositories
and these PPAs will no longer be required.


## Running It

You shouldn't need to run these scripts, but if you do, then you will need a
`.gnupg` directory setup to sign the Debian packages.  `scripts/build.sh` goes
through the various dances required to generate distribution-specific packages.


## Questions

Please post queries to the [discuss.ocaml.org](https://discuss.ocaml.org) forum
with the `opam` tag.
