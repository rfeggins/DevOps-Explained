#!/bin/sh

a="abc"
b="efg"
j
echo "variable a = abc"
echo "variable b = efg"

if [ $a = $b ]
then
   echo "$a = $b : a is equal to b"
else
   echo "else branch   $a = $b: a is not equal to b"
fi

if [ $a != $b ]
then
   echo "then branch   $a != $b : a is not equal to b"
else
   echo "$a != $b : a is equal to b"
fi

if [ -z $a ]
then
   echo "-z $a : string length is zero"
else
   echo "else branch    -z $a : string length is not zero"
fi

if [ -n $a ]
then
   echo "then branch    -n $a : string length is not zero"
else
   echo "-n $a : string length is zero"
fi

if [ $a ]
then
   echo "then branch    $a : string is not empty"
else
   echo "$a : string is empty"
fi
