#!/usr/bin/env bash
set -e

LOCKED="locked.tar.age"
DEC="dec"

if [ -d "$DEC" ]; then
  tar -C "$DEC" -cf locked.tar .
  age -p -o "$LOCKED" locked.tar
  rm -f locked.tar
  rm -rf "$DEC"
  echo "Locked"
else
  mkdir -p "$DEC"
  age -d -o locked.tar "$LOCKED"
  tar -C "$DEC" -xf locked.tar
  rm -f locked.tar
  echo "Unlocked"
fi
