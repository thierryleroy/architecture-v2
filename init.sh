if [ $# -eq 0 ]
  then
    echo "usage : init.sh module.name"
    exit -1
fi
MODULE=$1
echo $MODULE
PACKAGE_DIR=`echo -n "$MODULE" | sed  s/\\\\./\\\\//g`
echo "MODULE=$MODULE">module.profile
mkdir -p sources/java/$MODULE/$PACKAGE_DIR
echo "module $MODULE{exports $MODULE;}" > sources/java/$MODULE/module-info.java
mkdir -p dependencies/java
mkdir -p output/compile/java/
mkdir sources/www
mkdir sources/uml
mkdir sources/sql
mkdir -p .ide/eclipse/project/$MODULE
mkdir .Trash
cp eclipse.classpath  .ide/eclipse/project/$MODULE/.classpath
sed s/__MODULE__/$MODULE/ eclipse.project > .ide/eclipse/project/$MODULE/.project

mv eclipse.classpath .Trash
mv eclipse.project .Trash
mv init.sh .Trash

git init
git add .gitignore *.sh module.profile sources dependencies .ide
git commit -m "init"
git branch -M main
git remote add origin "git@github.com:thierryleroy/$module.git"
git push -u origin main

