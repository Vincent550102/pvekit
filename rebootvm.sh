#!/bin/bash

printhelp()
{
	echo "Usage: $0 [options]
Options:
  -h, --help    display this help message and exit
  -s, --start <vmid>    reboot vm from start
  -e, --end <vmid>      reboot vm to end
  -p, --parameter <rebootparameter>    reboot vm with rebootparameter"
	exit 0
}

argnum=$#
if [ $argnum -eq 0 ]
then
	printhelp
	exit 0
fi

startfrom=""
endto=""
rebootparameter=""

for a in $(seq 1 1 $argnum)
do
        nowarg=$1
        case "$nowarg" in
		-h|--help)
                        printhelp
                        ;;
                -s|--start)
                        shift
                        startfrom=$1
                        ;;
                -e|--end)
                        shift
                        endto=$1
                        ;;
                -p|--parameter)
                        shift
                        rebootparameter=$1
                        ;;
        esac
        shift
done

if [ "$startfrom" = "" ] || [ "$endto" = "" ]
then
	echo "Please add your range of reboot vm."
	printhelp
fi

if  [ "$startfrom" -gt "$endto" ]
then
	echo "Please check your range of reboot vm is vaild."
        printhelp
fi

for i in $(seq $startfrom $endto)
do
        qm reboot $startparameter $i
done
echo "successfully stop range of vm."