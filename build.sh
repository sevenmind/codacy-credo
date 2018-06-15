#!/usr/bin/env bash

set -e

elixir_version=$(cat .elixir-version)
echo "elixir version: $elixir_version"

docker_name=$1
docker_version=$2

docker build . --build-arg elixir_version=$elixir_version -t $docker_name:$docker_version