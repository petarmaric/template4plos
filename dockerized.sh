#!/bin/sh

VERSION="3.5.1"

docker run --rm -it --user="$(id -u):$(id -g)" --net=none --volume="$PWD":/paper petarmaric/template4plos:$VERSION $*
