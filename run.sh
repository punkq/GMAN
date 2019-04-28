#!/bin/bash

numDisc=(1, 2, 5 10)
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

python GMAN.py --dataset mnist --num_disc $n --dropout $d --ls_loss $l --mixing $m --lam 1. --objective modified --path mnist/$fname


done
done
done
done

