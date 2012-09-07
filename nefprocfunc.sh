#!/bin/sh
DIR="`basename $PWD`"
if [ $DIR="nef" ]
then
  exit;
fi
mkdir jpg
mkdir nef
ufraw-batch --wb=camera --exposure=auto --interpolation=bilinear --out-type=jpg --out-path="./jpg/" "$1"
mv $1 ./nef/
