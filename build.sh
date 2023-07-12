SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
cd $DIR
pwd
./clean.sh
./compile-java.sh
./package-java.sh
