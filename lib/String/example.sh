#!/bin/bash
cd ../..
source ooengine || exit 1

import String

# Create a String object.
aString=$(new String)

# Set the string itsself.
$aString set "This is a String!"

# Get the string.
$aString toString

# Get the strings length.
$aString length

# Check whether the string is empty.
if $($aString isEmpty); then
  echo "String is empty!"
else
  echo "String is not empty!"
fi