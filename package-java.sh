JAR_CMD="$JAVA_HOME/bin/jar"
if test -f "$JAR_CMD"
then
DIR="output/package/java"
MODULE_SOURCES='output/compile/java'
for MODULE_NAME in `ls -1 $MODULE_SOURCES`
do
NAME=`echo $MODULE_NAME | sed  -e "s/\\./-/g";`
mkdir -p $DIR
$JAR_CMD --create --file "$DIR/$NAME.jar" -C "$MODULE_SOURCES/$MODULE_NAME" .
$JAR_CMD --create --file "$DIR/$NAME-source.jar" -C "sources/java/$MODULE_NAME" .
done
else
echo "$JAR_CMD n'existe pas. Vérifiez la valeur de \$JAVA_HOME."
fi
