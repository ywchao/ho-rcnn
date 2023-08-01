#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../cache" && pwd )"
cd $DIR

FILE=det_base_caffenet_test2015.tar.gz
ID=1-5PCFfj8Uj3FihohZ7Rcm6Riuf5U9ENE

if [ -f $FILE ]; then
  echo "File already exists..."
  exit 0
fi

echo "Downloading precomputed Fast-RCNN detection (37G)..."

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&id=$ID" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')&id=$ID" -O $FILE && rm -rf /tmp/cookies.txt

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
