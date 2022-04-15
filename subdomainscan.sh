#!/bin/bash

echo "Beginning subdomain scan"
echo "Input [S] to scan a single domain or [L] to scan a list"
read sorl

if  [ $sorl = "s" ] || [ $sorl = "S" ] 
then
	echo "Please input the domain you would like to scan"
	read domainname
	echo "-------------------------------------------"
	bash -c "subfinder -d $domainname -silent -o scriptout"

elif [ $sorl = "l" ] || [ $sorl = "L" ]
then
	echo "Please input the path to the list of domains you want to scan"
	read pathtolist
	echo "-------------------------------------------"
	bash -c "subfinder -list $pathtolist -silent -o scriptout"
	
else
	echo "ERROR: Please input a valid option"
	sh $(basename $0) && exit
fi

echo "-------------------------------------------"
echo "Please input any Nuclei tags/fiters you would like to add, or press enter for none\nThe only tag currently added is -list"
read nucleitags
bash -c "nuclei -list scriptout $nucleitags"