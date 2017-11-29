#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../output" && pwd )"
cd $DIR

FILE=precomputed_ho_rcnn_models.tar.gz
URL=http://napoli18.eecs.umich.edu/public_html/data/wacv_2018/precomputed_ho_rcnn_models.tar.gz

if [ -f $FILE ]; then
  echo "File already exists..."
  exit 0
fi

echo "Downloading precomputed HO-RCNN models (4.0G)..."

wget $URL -O $FILE

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
