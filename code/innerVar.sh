echo $GROUPS

for n in 0 1 2 3 4 5
do
    echo ${GROUPS[$n]}
done


echo $HOSTNAME

echo $HOME

echo $HOSTTYPE

echo $IFS

echo $MACHTYPE

echo $PATH

output_args_one_per_line()
{
    for arg
    do echo "[$arg]"
    done
}

echo; echo "$IFS=\" \""
echo "------"

IFS=" "
var=" a  b c "
output_args_one_per_line $var

echo; echo "$IFS=\",\""
echo "------"

IFS=","
var="a,b,c"
output_args_one_per_line $var
