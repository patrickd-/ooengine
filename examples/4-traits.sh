#!/bin/bash

source ../ooengine || exit 1

# Example 4: Traits, makes multiple inheritance possible.

# 'Printer' trait class.
trait::Printer() {
  # Prints text without newline.
  method::out.print() {
    echo -ne "$@"
  }
  # Prints text with newline.
  method::out.println() {
    echo -e "$@"
  }
}

# 'SayHello' class.
class::SayHello() {

  # Use 'Printer' trait class.
  use Printer

  method::do() {
    # We inherited the 'out.println' method from 'Printer' class.
    $this out.println "Hello!"
  }
}

# 'Exiter' trait class.
trait::Exiter() {

  # Use 'Printer' trait class.
  use Printer

  # Successfully exits.
  method::exit() {
    $this out.println "Successfully exiting!"
    exit 0
  }
  # Exits with failure.
  method::die() {
    $this out.println "Exiting with failure!" 
    exit 1
  }
}

# 'SayGoodbye' class.
class::SayGoodbye() {

  # Use 'Printer' trait class.
  use Printer
  # Also use 'Exiter' trait class.
  use Exiter

  method::do() {
    # We inherited the 'out.println' method from 'Printer' trait class.
    $this out.println "Goodbye!"
    # Now exit, with inherited exit method from 'Exiter' trait class.
    $this exit
  }
}

helloer=$(new SayHello)
goodbyer=$(new SayGoodbye)

$helloer do
$goodbyer do