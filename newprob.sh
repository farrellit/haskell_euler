num=$1
if [ -z $num ]; then
	echo "Provide problem number." 1>&2
	exit 1
fi
if [ -e euler$num ]; then
	echo "euler$num exists already." 1>&2
	exit 2
fi
mkdir euler$num
cp euler6/Makefile euler$num
sed -i -e "s/euler6/euler$num/g" euler$num/Makefile

