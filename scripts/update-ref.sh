#!/bin/bash

set -e
shopt -s expand_aliases

PORT="$1"
VERSION="$2"
REF="$3"

PORT_DIR="ports/$PORT"
PORT_FILE="$PORT_DIR/portfile.cmake"
VCPKG_FILE="$PORT_DIR/vcpkg.json"
VERSION_DIR="versions/${PORT:0:1}-"
VERSION_FILE="$VERSION_DIR/$PORT.json"

GIT_REPO=$(grep -Eo "REPO\s+(.+)" "$PORT_FILE" | sed -r 's/REPO\s+(.+)/\1/g')
GIT_ARCHIVE_URL="https://github.com/$GIT_REPO/archive/$REF.tar.gz"
GIT_ARCHIVE_FILE="$TEMP/$REF.tar.gz"

curl -L -o "$GIT_ARCHIVE_FILE" "$GIT_ARCHIVE_URL"

SHA512=$(vcpkg hash "$GIT_ARCHIVE_FILE")

rm -f "$GIT_ARCHIVE_FILE"

sed -i -r -e "s/REF\s+[0-9a-fA-F]+/REF $REF/g" "$PORT_FILE"
sed -i -r -e "s/SHA512\s+[0-9a-fA-F]+/SHA512 $SHA512/g" "$PORT_FILE"

git add "$PORT_FILE"
git commit -m "feat: Update $PORT:$VERSION to $REF"

GIT_TREE=$(git rev-parse "HEAD:$PORT_DIR")

jq --arg version "$VERSION" --arg git_tree "$GIT_TREE" '
    .versions |= (
      if any(.version == $version) then
          map(if .version == $version then ."git-tree" = $git_tree else . end)
      else
          . + [{ "version": $version, "git-tree": $git_tree }]
      end
    )
' "$VERSION_FILE" > "$VERSION_FILE.tmp"

jq --arg version "$VERSION" '.version = $version' "$VCPKG_FILE" > "$VCPKG_FILE.tmp"

mv "$VERSION_FILE.tmp" "$VERSION_FILE"
mv "$VCPKG_FILE.tmp" "$VCPKG_FILE"

git add "$VERSION_FILE" "$VCPKG_FILE"
git commit --amend --no-edit

git push
git log -n 1 --pretty=%H