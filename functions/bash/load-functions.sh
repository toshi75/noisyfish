#!/usr/bin/env bash
DIR="$(pwd)"
cd "$(cd "$(dirname "$0")" ;pwd)"
for i in *.function ;do
    source "$i"
done
cd "$DIR"
exit 0
