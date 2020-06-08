#!/bin/bash
export GOPATH=${PWD}
[ -d src ] || mkdir src
cd src
[ -d src/goile ] || {
  git clone https://github.com/gomatic/goile.git
}
cd goile
make
make test
