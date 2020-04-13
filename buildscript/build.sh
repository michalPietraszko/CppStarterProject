#!/bin/bash

cd "$(dirname "$0")"
./premake5 gmake2
cd ../build

if [ ! -z "$params" ]
then
    make "$params"
else
    make 
fi
