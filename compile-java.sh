. module.profile
JAVAC_CMD="$JAVA_HOME/bin/javac"
if test -f "$JAVAC_CMD"
then
$JAVAC_CMD --module-source-path sources/java --module-path dependencies/java  -d output/compile/java -m $MODULE
else
echo "$JAVAC_CMD n'existe pas. Vérifiez la valeur de \$JAVA_HOME."
fi
