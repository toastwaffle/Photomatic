#! /bin/sh
cd /home/samuel/Pictures/D3000/
SUFF=NEF
if [ $# = 1 ]
then
	cd $1
fi
find . -type f -name *.$SUFF -exec /home/samuel/Pictures/D3000/nefprocfunc.sh {} \;

exit;
