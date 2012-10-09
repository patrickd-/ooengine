#!/bin/bash

source ../ooengine || exit 1

# Example 7: Magic globals, funky stuff.

class::someParentClass() {
  :
}

class::someClass::extends::someParentClass() {

  private test1
  private test2
  private test3
  public test4
  public test5

  method::getClassName() {
    # The $__CLASS global contains the name of the objects class.
    echo "Class name: $__CLASS"
  }

  method::getBaseName() {
    # The $__BASE global contains the objects class parent name.
    echo "Parent name: $__BASE"
  }

  method::getObjectId() {
    # The $__OBJECT global contains the unique object ID.
    echo "Object ID: $__OBJECT"
  }

  method::listAttributes() {
    # The global $__ATTRIBUTES array contains the objects attibutes.
    local attribute
    local attribute_info
    for attribute in ${__ATTRIBUTES[@]}
    do
      # Each attribute is saved as [private|publish]:[attribute name].
      attribute_info=(${attribute/:/ })
      echo "There is a ${attribute_info[0]} attribute called '${attribute_info[1]}'"
    done
  }
}

someObject=$(new someClass)

$someObject getClassName

$someObject getBaseName

$someObject getObjectId

$someObject listAttributes