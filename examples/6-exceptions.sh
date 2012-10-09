#!/bin/bash

source ../ooengine || exit 1

# Example 6: Exception handling, simplistic throwing and catching.

# A class throwing an exception.
class::fooClass() {

  ##
  # Throwing Exceptions:
  method::letsThrowIt()  {
    # This will throw the default exception class named 'Exception'.
    # Uncatched exceptions will call toString and exit execution.
    throw Exception "Okay, I threw it on purpose!"
    # Syntax: throw [Exception] [exception parameters] ...
  }

}

# A custom exception handler.
exceptionHandler() {
  # Print error message with call stack.
  $exception printStack 1>&2
  # Exiting with failure, is what the default handler would do.
  # exit 1
}

##
# Catching Exceptions:
##
fooObject=$(new fooClass)

# Define a try block, everything what happens can be catched.
try() {
  $fooObject letsThrowIt
}
catch Exception exceptionHandler
# The catch function will call the try block, catch the specified
# Exception and pass it to your custom exception handler.


##
# Default Exceptions:
#
# There are some default exceptions you can make use of.
defaultExceptions() {
  throw IllegalArgumentException "Some function arguments where wrong!"
  throw UnknownLibraryException "Internal exception for unknown libraries."
  throw UndefinedMethodException "Internal exception for undefined methods."
  throw UndefinedClassException "Internal exception for undefined classes."
  throw UndefinedAttributeException "Internal exception for undefined attributes."
}

##
# Custom Exceptions:
#
# Custom Exceptions should extend from 'Exception'.
class::ErrorCodeException::extends::Exception() {

  # The public message attribute will be inherited from 'Exception'.
  # public message

  # Lets add an error code.
  public code

  ##
  # Override the default setParameters method of 'Exception' to
  # save out error code.
  method::setParameters() {
    $this set message "$1"
    $this set code "$2"
  }

  ##
  # Override the default toString method, to add the code to the output.
  method::toString() {
    local message=$($this get message)
    local code=$($this get code)
    echo "$__CLASS (code: $code): $message"
  }
}

# Throw a custom exception:
throw ErrorCodeException "Let's throw this custom exception!" 444
# It will be catched by the default exception handler for 'Exception'.