#!/bin/sh

# Comments are used The following example shows how to add two numbers −


# Variable named val
echo "Adding two numbers"
echo "What is the first number?"
read num1
echo "What is the second number?"
read num2

echo "Adding  $num1 + $num2"

val=`expr $num1 + $num2`

echo "Total value : $val"
