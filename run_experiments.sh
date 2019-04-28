#!/bin/bash

numDisc=(1 2 5 10)
dropout=(True False)
lsloss=(True False)

for n in "${numDisc[@]}"
do
for d in "${dropout[@]}"
do
for l in "${lsloss[@]}"
do
for m in {arithmetic,geometric,harmonic}
do

fname="NumDisc_"$n"_Dropout_"$d"_LSloss_"$l"_"$m
log=$fname".log"

python GMAN.py --dataset mnist --num_disc $n --dropout $d --ls_loss $l --mixing $m --lam 1. --objective modified --path mnist/$fname >> log/$log

while true;do
	grep -n "model.ckpt-24" disc1.txt
		if [ $? -ne 0 ]; then
			echo 'waiting ...'
		else
			break
		fi
	sleep 60
done

done
done
done
done

