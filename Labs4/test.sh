#!/bin/bash

file="labfiles\students\groups/$1"

max=0
flag=0

let resultIndex=0

for var in $(cat $file)
do
grep=$(grep -wh "$var" $file | grep -oE '^[A-Z]+[a-z]*')

number=$(echo -n "$grep" | wc -m)

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
grep=$(grep -wh "$var" $file | grep -oE '^[A-Z]+[a-z]*')
number=$(echo -n "$grep" | wc -m)

if [[ ("$number" == "$max") && ("$flag" == "1")]];
    then
        echo "Ученик с самой длинной фамилией:$var, длина фамилии: $max" 
    fi

 if [[ "$flag" -eq 2 ]]; then
    echo "Ученики с самыми длинными фамилиями:"
    flag=3
    fi


if [[ ("$flag" -eq 3) && ("$number" == "$max") ]];
    then
    echo "$var, длина фамилии: $max"
    fi
let resultIndex++
done
