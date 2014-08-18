WRONG_DIR=12

clear

targetDir=~/workspace/test/emptyTest

cd $targetDir
echo "Delete file in $targetDir"

if [ "$PWD" != "$targetDir" ]
then
    echo "wrong directory"
    exit $WRONG_DIR
fi

rm -rf *
rm .[A-Za-z0-9]*

echo
echo "Done."

exit 0
