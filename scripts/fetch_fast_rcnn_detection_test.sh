#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../cache" && pwd )"
cd $DIR

FILE=det_base_caffenet_test2015.tar.gz
URL=http://napoli18.eecs.umich.edu/public_html/data/wacv_2018/det_base_caffenet_test2015.tar.gz

if [ -f $FILE ]; then
  echo "File already exists..."
  exit 0
fi

echo "Downloading precomputed Fast-RCNN detection (37G)..."

wget $URL -O $FILE

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
