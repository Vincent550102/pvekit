#!/bin/bash

printhelp()
{
	echo "Usage: $0 [options]
Options:
  -h, --help                            display this help message and exit
  -s, --start <vmid>                    rollback vm from start
  -e, --end <vmid>                      rollback vm to end
  -n, --snapshotname <snapshotname>     snapshot name
  -p, --parameter <srollbackparameter>  rollback vm with rollbackparameter"
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
snapshotname=""
rollbackparameter=""

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
                -n|--snapshotname)
                        shift
                        snapshotname=$1
                        ;;
                -p|--parameter)
                        shift
                        rollbackparameter=$1
                        ;;
        esac
        shift
done

if [ "$startfrom" = "" ] || [ "$endto" = "" ]
then
	echo "Please add your range of rollback vm."
	printhelp
fi

if [ "$snapshotname" = "" ]
then
	echo "Please add your snapshot name."
	printhelp
fi

if  [ "$startfrom" -gt "$endto" ]
then
	echo "Please check your range of rollback vm is vaild."
        printhelp
fi



for i in $(seq $startfrom $endto)
do
        qm rollback $i $snapshotname $rollbackparameter &
done
echo "successfully rollback range of vm."