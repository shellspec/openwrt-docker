#!/bin/sh

set -eu

IMAGE='' URI='' PUSH='' PREFIX='shellspec/' IMAGES="${0%/*}/images"

usage() {
cat<<HERE
Usage: build.sh [OPTIONS] IMAGE

OPTIONS:
  -p, --push      Push docker image to dockerhub
  -h, --help

IMAGE:
HERE
while read -r image uri; do
  echo "  $image"
done < "$IMAGES"
}

abort() {
  echo "$*" >&2
  exit 1
}

for arg; do
  case $arg in
    -p | --push) PUSH=1 ;;
    -h | --help) usage; exit ;;
    -*) abort "Unknown option '$arg'" ;;
    *) set -- "$@" "$arg"
  esac
  shift
done

[ $# -eq 0 ] && abort 'image not specified'
IMAGE=$1

while read -r image uri; do
  [ "$image" = "$IMAGE" ] && URI=$uri && break
done < "$IMAGES"

[ "$URI" ] || abort 'image not found'

docker import "$URI" "$PREFIX$IMAGE"

if [ "$PUSH" ]; then
  docker push "$PREFIX$IMAGE"
fi
