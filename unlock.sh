#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
gpg --decrypt diary.key.gpg > diary.key
git-crypt unlock diary.key
rm diary.key

echo "Repository unlocked."
