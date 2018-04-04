#!/bin/sh

if [ $# -ne 1 ]; then
  echo "usage: docker run --rm --volume \$(pwd):/mnt nmatsui/swagger2spectacle swagger_filename.yaml"
  exit 1
fi

YAML_FILE=${1}
BASE_NAME=${YAML_FILE%.*}

if [ ! -e /mnt/${YAML_FILE} ]; then
  echo "${YAML_FILE} not found"
  exit 1
fi

/opt/node_modules/.bin/spectacle -t . /mnt/${YAML_FILE}
sed -i -e 's#<link rel="stylesheet" href="stylesheets/foundation.min.css" />#<link inline rel="stylesheet" href="stylesheets/foundation.min.css" />#' /opt/index.html
sed -i -e 's#<link rel="stylesheet" href="stylesheets/spectacle.min.css" />#<link inline rel="stylesheet" href="stylesheets/spectacle.min.css" />#' /opt/index.html
sed -i -e 's#<script src="javascripts/spectacle.min.js"></script>#<script inline src="javascripts/spectacle.min.js"></script>#' /opt/index.html
/opt/node_modules/.bin/inline-source --compress false index.html > /mnt/${BASE_NAME}.html

exit 0

