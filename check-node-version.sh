#!/usr/bin/env bash

set -o errexit

# Strip leading and trailing whitespace like perl's chomp.
chomp() {
    echo -n "${@//[[:space:]]/}"
}

readonly EXPECTED_NODE_VERSION=v"$@"
readonly NODE_VERSION="$(chomp $(node --version))"

if [[ $EXPECTED_NODE_VERSION == $NODE_VERSION ]]
then
    echo "Expected node version $EXPECTED_NODE_VERSION matches $NODE_VERSION."
    exit 0
fi

echo "ERROR: Expected node version $EXPECTED_NODE_VERSION does not match $NODE_VERSION."
exit 1
