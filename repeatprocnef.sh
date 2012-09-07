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
while [ 1==1 ]
do
	for i in $(ls *.$SUFF)
	do
		ufraw-batch --wb=camera --exposure=auto --interpolation=bilinear --out-type=jpg --out-path="./jpg/" "$i"
		mv $i ./nef/
	done
done

exit;
