#!/bin/sh
PATH=/bin:/usr/bin:
export PATH

######Variables######
backupdir=/backup/
inputfile=/dev/md1
outputfilename=data.img
logfile=/var/log/backup.log
date=`date +%F`
#####################

oldestimg=`ls $backupdir|grep $outputfilename|head -1`
outputfile="$backupdir$outputfilename.$date"
rmimg="$backupdir$oldestimg"

rm $rmimg
dd if="$inputfile" of="$outputfile"
echo `date +%F" "%T`: Success >> $logfile
