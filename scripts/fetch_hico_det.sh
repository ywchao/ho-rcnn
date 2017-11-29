#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../data" && pwd )"
cd $DIR

FILE=hico_20160224_det.tar.gz
URL=http://napoli18.eecs.umich.edu/public_html/data/hico_20160224_det.tar.gz

if [ -f $FILE ]; then
  echo "File already exists..."
  exit 0
fi

echo "Downloading HICO-DET (7.5G)..."

wget $URL -O $FILE

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
