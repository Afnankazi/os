#!/bin/bash

echo "Enter first string:"
read str1

echo "Enter second string:"
read str2

if [ "$str1" = "$str2" ]; then
    echo "The strings are equal."
else
    echo "The strings are not equal."
fi
