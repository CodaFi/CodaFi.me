#!/bin/bash

INDEXFILES=./_elm/src/*.elm
BLOGFILES=./_elm/src/blogs/*.elm

for b in $INDEXFILES
do
    echo "Building $b..."
    OUTP=$(basename "$b")
    NAME=${OUTP%.*}
    elm-make $b --output="./$NAME.html"
done

mv "CodaFi.html" "index.html"
mv "Error404.html" "404.html"

for b in $BLOGFILES
do
    echo "Building $b..."
    OUTP=$(basename "$b")
    NAME=${OUTP%.*}
    elm-make $b --output="./blog/$NAME.html"
done

