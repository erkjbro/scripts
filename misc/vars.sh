#!/bin/bash

if [ $1 ]
  then VALUE=$1
  else read -p "provide a value: " VALUE
fi

echo $VALUE
