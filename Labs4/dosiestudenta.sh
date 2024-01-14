#!/bin/bash
file="labfiles\students\groups\/$1"

read -p "Введите фамилию студента:" surname

path=$(grep -hr -A1 "$surname" 'labfiles\students\general\notes')
puth=$(grep -rl "$surname" 'labfiles\students\general\notes')

echo  "$path"

read -p "Введите новую фразу:" words 

counter=$(grep -hnr -A0 "$surname" 'labfiles\students\general\notes' | sed 's/:.*//')
number=$(expr "$counter" + 0)

#sed -n 23p 's/ $/$words/' labfiles\students\general\notes/DNames.log

echo "$words"

#awk 'NR==5{print "$words"}7' $puth

awk 'NR==5{$0=$0 "$words"}1' $puth

#sed 's/$/СУФФИКС/' ФАЙЛ