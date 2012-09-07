#!/bin/sh

Today="/home/samuel/Pictures/D3000/2011/tether`date +%d%m%y%H%M`"
mkdir $Today
cd $Today
CAMERA_FOLDER=/store_00010001
export Today
echo "Press CTRL-C to quit.\n";
while [ 1==1 ]
do
	gphoto2 --folder="$CAMERA_FOLDER" --capture-tethered --hook-script=/home/samuel/Pictures/D3000/Scripts/view.sh
	sleep 1
done

exit;

