#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../data" && pwd )"
cd $DIR

FILE=hico_20160224_det.tar.gz
ID=1dUByzVzM6z1Oq4gENa1-t0FLhr0UtDaS

if [ -f $FILE ]; then
  echo "File already exists..."
  exit 0
fi

echo "Downloading HICO-DET (7.5G)..."

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&id=$ID" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')&id=$ID" -O $FILE && rm -rf /tmp/cookies.txt

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
