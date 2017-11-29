#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../output" && pwd )"
cd $DIR

FILE=precomputed_hoi_detection.tar.gz
URL=http://napoli18.eecs.umich.edu/public_html/data/wacv_2018/precomputed_hoi_detection.tar.gz

if [ -f $FILE ]; then
  echo "File already exists..."
  exit 0
fi

echo "Downloading precomputed HOI detection (2.0G)..."

wget $URL -O $FILE

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
