#!/bin/bash

source ../ooengine || exit 1

# Example 8: Overriding default Class methods.

class::OverrideAllTheThingsClass() {

  ##
  # Overrides standard attribute getter.
  method::get() {
    # ... do something before ...
    
    # Call the standard get method. 
    $parent get "$@"

    # ... or afterwards ...
  }

  ##
  # Overrides standard attribute setter.
  method::set() {
    # ... do something before ...

    # Call the standard set method. 
    $parent set "$@"

    # ... or afterwards ...
  }

  ##
  # Overrides default toString method.
  method::toString() {
    # ... do something before ...
    
    # You may call the standard toString method. 
    $parent toString

    # ... or afterwards ...
  }

  ##
  # Overrides default destructor.
  method::destruct() {
    # ... do something before ...

    # Call the standard destruct method. 
    $parent destruct

    # ... or - no wait, don't do something
    # after deconstructing your self!
  }

  ##
  # Overrides standard clone method.
  method::clone() {
    # ... do something before ...

    # Call the standard clone method. 
    $parent clone $@

    # ... or afterwards ...
  }

}