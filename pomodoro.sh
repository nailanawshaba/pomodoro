#!/usr/bin/env bash

for i in `seq 25 -1 1`; do
        echo -n $i' '
	sleep 1m
done

FILE=sounds/`ls sounds|sort -R|head -1`
echo $FILE

if [ `which ffplay|wc -l` -eq 1 ]; then
	ffplay -nodisp -loglevel panic $FILE
else
	if [ `which mplayer|wc -l` -eq 1 ]; then
		mplayer -really-quiet $FILE
	else
		if [ `which mpg123|wc -l` -eq 1 ]; then
			mpg123 $FILE
		else
			if [ `which beep|wc -l` -eq 1 ]; then
				beep
			else
				echo 'ERROR: Could not find supported audio player'
				exit 1
			fi
		fi
	fi
fi
