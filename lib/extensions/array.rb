#!/usr/local/bin/ruby -w
#
# == extensions/array.rb
#
# Adds methods to the builtin Array class. 
#

require "extensions/_base"

#
# * Array#select!
#
ExtensionsProject.implement(Array, :select!) do
  class Array
    #
    # In-place version of Array#select.  (Counterpart to, and opposite of, the
    # built-in #reject!)
    #
    def select!
      reject! { |e| not yield(e) }
    end
  end
end


#
# * Array#only
#
ExtensionsProject.implement(Array, :only) do
  class Array
    #
    # Returns the _only_ element in the array.  Raises an IndexError if the array's size is not
    # 1.
    #
    #   [5].only      # -> 5
    #   [1,2,3].only  # -> IndexError
    #   [].only       # -> IndexError
    #
    def only
      unless size == 1
        raise IndexError, "Array#only called on non-single-element array"
      end
      first
    end
  end
end


