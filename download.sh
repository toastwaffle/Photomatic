#!/bin/sh
Today="/home/samuel/Pictures/D3000/`date +%Y`/download`date +%d%m%y%H%M`"
mkdir -p $Today
cd $Today
gphoto2 --auto-detect
echo "Please enter the port of the camera"
read CAMERA_FOLDER
gphoto2 --port="$CAMERA_FOLDER" --get-all-files && gphoto2 --port="$CAMERA_FOLDER" --delete-all-files -R
exiftool -r -P -overwrite_original -Author='Samuel Littley - samuel.littley@scoutmail.org.uk' -Copyright='©Samuel Littley Creative Commons BY-NC-SA' $Today
echo "Done"
exit;

