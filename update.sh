#!/bin/bash

set -eo pipefail

declare -a versions=(
  7-apache
  7
)

for version in "${versions[@]}"
do
  rm -rf "$version"
  mkdir "$version"

  cat > "$version/Dockerfile" <<-END
# Generated automatically by update.sh
# Do no edit this file

FROM php:${version}

RUN docker-php-ext-install mysqli
END

done
