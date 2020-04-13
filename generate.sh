#!/bin/bash

cd ./buildscript 
conan install .

if [ ! -z "$1" ]
then
    export params="config=release"
fi

source ./build.sh
