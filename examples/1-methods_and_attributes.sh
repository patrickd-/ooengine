#!/bin/bash

source ../ooengine || exit 1

# Example 1: Simple methods and attributes.

# A simple base class named 'TestClass'.
class::TestClass() {

  # Public attribute, 'get' and 'set'-able.
  public attributePublic "optional default value"

  # Private attribute, only internal 'get' and 'set'-able.
  private attributePrivate "optional default value"

  # Public method, reachable with any reference.
  method::publicTestMethod() {
    echo "Do something here."
    # Call private method.
    $this internalTestMethod
  }

  # Public getter method for private attribute 'attributePrivate'.
  method::getAttributePrivate() {
    $this get attributePrivate
  }

  # Public setter method for private attribute 'attributePrivate'.
  method::setAttributePrivate() {
    $this set attributePrivate "$1"
  }

  # Private method, only internal reachable with $this reference.
  __method::internalTestMethod() {
    echo "Or do something here."
  }
}

# Create an object of the class.
testObject=$(new TestClass)


# Call a method.
$testObject publicTestMethod


# Get a public attribute.
value=$($testObject get attributePublic)
echo $value

# Set a public attribute.
$testObject set attributePublic "New value"


# Get a private attribute.
# echo $($testObject get attributePrivate) # This would fail.
value=$($testObject getAttributePrivate)
echo $value

# Set a private attribute.
# $testObject set attributePrivate # This would fail.
$testObject setAttributePrivate "New value"