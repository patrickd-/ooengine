#!/bin/bash

source ../ooengine || exit 1

# Example 3: Class decoration, for injecting methods and attributes.

# 'Animal' base class.
class::Animal() {
  # All animals should be able to eat.
  method::eat() {
    echo "nom nom nom.."
  }
}

# 'AnimalMovement' class, decorates 'Animal'.
class::AnimalMovement::decorates::Animal() {
  # All animals should be able to move.
  method::move() {
    echo "moving.."
  }
}

# 'Dog' class, extends 'Animal'.
class::Dog::extends::Animal() {
  # Only dogs are able to bark.
  method::bark() {
    echo "Woof woof"
  }
}

# 'DogSnarling' class, decorates 'Dog'.
class::DogSnarling::decorates::Dog() {
  # Dogs should be able to snarl.
  method::snarl() {
    echo "grrrrrrr"
  }
}

# Create an animal.
someAnimal=$(new Animal)
# An animal is able to eat.
$someAnimal eat
# By decoration, animals are also able to move.
$someAnimal move

# Create a dog.
someDog=$(new Dog)
# Dogs are also able to eat as they inherit it from animals.
$someDog eat
# But dogs are additionally able to bark.
$someDog bark
# By inherited decoration, dogs are also able to move.
$someDog move
# By decoration, dogs are able to snarl.
$someDog snarl