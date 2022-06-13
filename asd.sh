echo $1
echo $2

if [ "$1" -gt "$2" ]
then
	echo "NO"
fi

for i in $(seq $1 $2)
do
	echo $i
done
