#!/bin/sh

docker run --rm -it --user="$(id -u):$(id -g)" --net=none --volume="$PWD":/paper petarmaric/template4plos $*
