#!/bin/bash

printhelp()
{
	echo "Usage: $0 [options]
Options:
  -h, --help                            display this help message and exit
  -s, --start <vmid>                    snapshot vm from start
  -e, --end <vmid>                      snapshot vm to end
  -n, --snapshotname <snapshotname>     snapshot name
  -p, --parameter <snapshotparameter>   snapshot vm with startparameter"
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
snapshotparameter=""

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
                        snapshotparameter=$1
                        ;;
        esac
        shift
done

if [ "$startfrom" = "" ] || [ "$endto" = "" ]
then
	echo "Please add your range of snapshot vm."
	printhelp
fi

if  [ "$startfrom" -gt "$endto" ]
then
	echo "Please check your range of snapshot vm is vaild."
        printhelp
fi

if  [ "$snapshotname" = "" ]
then
	$snapshotname=`date +"%Y_%m_%d_%I_%M_%S`
fi

for i in $(seq $startfrom $endto)
do
        qm snapshot $i $snapshotname $snapshotparameter &
done
echo "successfully snapshot range of vm."