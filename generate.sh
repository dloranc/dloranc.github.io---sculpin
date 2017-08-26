#!/bin/bash

cd output_prod
find * -maxdepth 0 -name '.git' -prune -o -exec rm -rf '{}' ';'
cd ..

php bin/sculpin generate --env=prod