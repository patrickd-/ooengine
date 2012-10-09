#!/bin/bash

source ../ooengine || exit 1

# Example 2: Class inheritance of methods and attributes.

# 'Animal' base class.
class::Animal() {
  # All animals should be able to eat.
  method::eat() {
    echo "nom nom nom.."
  }
}

# 'Dog' class, extends 'Animal'.
class::Dog::extends::Animal() {
  # Only dogs are able to bark.
  method::bark() {
    echo "Woof woof"
  }
}

# 'Cat' class, extends 'Animal'.
class::Cat::extends::Animal() {
  # Cats are able to purr.
  method::purr() {
    echo "purrrrrr"
  }
}

# 'PurringCat' class, extends 'Cat'.
class::PurringCat::extends::Cat() {
  # This cat purrs while eating.
  method::eat() {
    # Call inherited purring method.
    $this purr
    # Call the parents eat method.
    $parent eat
  }
}


# Create an animal.
someAnimal=$(new Animal)
# An animal is able to eat.
$someAnimal eat

# Create a dog.
someDog=$(new Dog)
# Dogs are also able to eat as they inherit it from animals.
$someDog eat
# But dogs are additionally able to bark.
$someDog bark

# Create a cat.
someCat=$(new Cat)
# Cats are as well able to eat and to purr.
$someCat eat
$someCat purr

# Create a purring cat.
aPurringCat=$(new PurringCat)
# This cat always purrs while eating.
$aPurringCat eat