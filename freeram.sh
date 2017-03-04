#!/bin/bash


PrintUsage() {
	echo -e "No input is given for cleanup"
	echo -e "freeram.sh number"
	echo -e "\t1: drop pagecache"
	echo -e "\t2: drop dentries and inodes"
	echo -e "\t3: drop both"
}

PAGECACHE=1
FILES=2
PAGEFILE=3

IN=$1

if [ -z "$IN" ]
then
	PrintUsage;
	exit 1
fi


case "$IN" in
	$PAGECACHE)
		echo -e "Removing pagecache"
		sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
		;;
	$FILES)
		echo -e "Do not try to remove dentries and inodes"
		#sudo sh -c 'echo 2 > /proc/sys/vm/drop_caches'
		exit 1
		;;
	$PAGEFILE)
		echo -e "Do not try to remove pagecache with dentries and inodes"
		#sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
		exit 1
		;;
	*)
		echo -e "Unknow parametar used $IN";
		PrintUsage;
		exit 1
		;;
esac
