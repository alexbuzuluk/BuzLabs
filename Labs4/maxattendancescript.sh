#!/bin/bash

file="labfiles\students\groups/$1"

max=0
flag=0

let index=0
let resultIndex=0

for var in $(cat $file)
do
grep=$(grep -wh "$var[[:space:]][01]*$" labfiles/*/$numgroup-attendance| sed 's/[A-Za-z]*[[:space:]]//g' | sed 's/./& /g'| tr " " "\n")
number=$(grep -co 1 <<<$grep)

if [[ ("$number" == "$max") && ("$flag" == "1")]];
        then
        flag=2
fi

if [ "$number" -gt "$max" ]
    then
        max="$number"
        flag=1
    fi
let index++
done

for var in $(cat $file)
do
grep=$(grep -wh "$var[[:space:]][01]*$" labfiles/*/$numgroup-attendance| sed 's/[A-Za-z]*[[:space:]]//g' | sed 's/./& /g'| tr " " "\n")
number=$(grep -co 1 <<<$grep)

if [[ ("$number" == "$max") && ("$flag" == "1")]];
    then
        echo "Ученик с лучшей посещаемостью:$var, количество посещений: $max" 
    fi

 if [[ "$flag" -eq 2 ]]; then
    echo "Ученики с лучшей посещаемостью:"
    flag=3
    fi


if [[ ("$flag" -eq 3) && ("$number" == "$max") ]];
    then
    echo "$var, количество посещений: $max"
    fi
let resultIndex++
done
