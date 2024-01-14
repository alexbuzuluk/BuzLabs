#!/bin/bash
read -p "Enter group: " numgroup

file="labfiles\students\groups/$numgroup"
min=10000
indexMin=0
max=0
indexMax=0

let index=0
let resultIndex=0

for var in $(cat $file)
do
grep=$(grep -wh "$var[[:space:]][01]*$" labfiles/*/$numgroup-attendance| sed 's/[A-Za-z]*[[:space:]]//g' | sed 's/./& /g'| tr " " "\n")
number=$(grep -co 1 <<<$grep)
if [[ "$number" -lt "$min" ]]; then
        min="$number"
	indexMin="$index"
    fi
 if [ "$number" -gt "$max" ]
    then
        max="$number"
	indexMax="$index"
    fi
let index++
done

for var in $(cat $file)
do
 if [ "$resultIndex" == "$indexMax" ]
    then
        echo "Ученик с лучшей посещаемостью:$var, количество посещений: $max" 
    fi
 if [ "$resultIndex" == "$indexMin" ]
    then
        echo "Ученик с худшей посещаемостью:$var, количество посещений: $min" 
    fi
let resultIndex++
done