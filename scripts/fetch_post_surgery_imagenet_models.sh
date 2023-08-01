#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../data" && pwd )"
cd $DIR

FILE=imagenet_models.tar.gz
ID=1EKyc4anI1KxNfm9D0tj8D5dQ2pXl8Zzv

if [ -f $FILE ]; then
  echo "File already exists..."
  exit 0
fi

echo "Downloading precomputed HO-RCNN models (411M)..."

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&id=$ID" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')&id=$ID" -O $FILE && rm -rf /tmp/cookies.txt

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
