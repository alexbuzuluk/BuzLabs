#!/bin/bash

echo -e "\033[1mЛабораторная работа №4\033[0m"
echo -e "\033[1mВыполнила бригада: РЖД-Т\033[0m"

numscript=0

read -p "Введите номер группы:" numgroup

file="labfiles\students\groups/$numgroup"


while ! cat $file 1>/dev/null 2>/dev/null
do
    echo -e "\nНесуществующий номер группы, введите нормально из нижеперечисленных:"
    ls labfiles/students/groups/
    read -p "Enter group: " numgroup
    file="labfiles\students\groups/$numgroup"
done

while :
do
 echo -e "\nВыберите что-нибудь нормальное:"
 echo "3 - Поиск студентов с минимальной посещаемостью"
 echo "4 - Поиск студентов с максимальной посещаемостью"
 echo "5 - Поиск студентов с самой длинной фамилией"
 echo "6 - Дописать по фамилии что-то"
 echo "7 - Выход"
 read -p "Выберите скрипт: " numscript 
 if [[ "$numscript" == "3" ]]
    then
        source minattendancescript.sh $numgroup
 elif [ "$numscript" == "4" ]
    then
        source maxattendancescript.sh $numgroup
 elif [ "$numscript" == "5" ]
    then
        source test.sh $numgroup
 elif [ "$numscript" == "6" ]
    then
        source dosiestudenta.sh $numgroup
 elif [ "$numscript" == "7" ]
    then
        break
 else
       echo -e "\nДанной команды нет!"
 fi
done


$SHELL
