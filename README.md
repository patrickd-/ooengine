ooengine
========

Intuitive pseudo object orientation for bash (Shell Script)

Features:
--------------------------------------
1. "Real classes" containing methods.
2. Created objects saved in variables.
3. Public / private attributes.
4. Inheritance (extending classes).
5. Traits (multiple inheritance).
6. Cloning of objects.
7. Exceptions - throw and catch them.
As intuitive as possible (it's still bash though).

Crash course:
--------------------------------------
1. 'Classes' are functions, prefixed with 'class::'.
2. 'Methods' are functions within classes, prefixed with 'method::'.
3. 'Objects' are created by calling new [Class name], save it's return value into a variable.

Example:

```#!/bin/bash
source ooengine || exit 1

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

# Destruct the object.
$testObject destruct
```

More?
--------------------------------------
Please have a look at the examples in ./examples directory!


Packed libraries
--------------------------------------
- Console (Incomplete) - Console/IO help functions.
- String (Incomplete) - String class.
- Array (Planned)
- MySQL (Planned)
- ... (Planned)

Using libraries
--------------------------------------

Use libraries by importing them:
```import String # (searches for $librarypath/String/String)
import String/StringManipulation # (searches for $librarypath/String/StringManipulation)
```

Use own library directories:
```add ./mylibraries
import MyLibrary
import MyLibrary/SubClass
```