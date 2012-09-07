#! /bin/sh

SUFF=NEF
if [ $# = 1 ]
then
	cd $1
else
	cd /home/samuel/Pictures/D3000/
fi
mkdir jpg
mkdir nef
	for i in $(ls *.$SUFF)
	do
		ufraw-batch --wb=camera --exposure=auto --interpolation=bilinear --out-type=jpg --out-path="./jpg/" "$i"
		mv $i ./nef/
	done

exit;
