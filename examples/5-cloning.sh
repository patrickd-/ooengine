#!/bin/bash

source ../ooengine || exit 1

# Example 5: Object cloning.

class::Human() {

  private name $__OBJECT

  method::setName() {
    $this set name "$1"
    echo "Hello my ID is $__OBJECT, but you gave me the name $1, thank you!"
  }

  method::tellName() {
    local name=$($this get name)
    echo "My name is $name and my ID was $__OBJECT!"
  }

}

# Create a guy called daniel.
daniel=$(new Human)
$daniel setName "Daniel"
$daniel tellName

# Create some other guy as base.
danielsClone=$(new Human)

# Clone daniel.
$daniel clone $danielsClone

# Now we got two daniels!
$danielsClone tellName

# Let's kill the clone before this goes crazy.
$danielsClone destruct