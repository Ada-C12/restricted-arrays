require_relative "restricted_array.rb"

require "pry"
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil

#SPACE & TIME COMPLEXITY:
# Time complexity: would be O(n) we have to iterate through every single index in order to count it and
# We don't know how long the data structure is going to be.
# Space complexity: O(1) There are no added data structures being added besides the counter variable.
def length(array)
  if array != []
    counter = 0
    i = 0
    until array[i] == nil
      i += 1
      counter += 1
    end
    return counter
  end
end

# Prints each integer values in the array
# Time complexity: This would be O(n) becuase it iterates through an array printing out each value and we don't know how long the array will be.
# Space complexity: This would be O(1) becuase it there are no continual additions of data structures
def print_array(array)
  length = length(array)
  string = ""
  i = 0
  while i < length
    string += array[i] + " "
    i += 1
  end
  print(string)
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(logn)
# Space complexity: O(1)

def search(array, length, value_to_find)
  i = 0
  while i < length
    if array[i] == value_to_find
      return true
    else
      i += 1
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)

def find_largest(array, length)
  largest = array[0]
  i = 0
  while i < length
    if array[i] > largest
      largest = array[i]
      i += 1
    end
    i += 1
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def find_smallest(array, length)
  smallest = array[0]
  i = 0
  while i < length
    if array[i] < smallest
      smallest = array[i]
      i += 1
    end
    i += 1
  end
  return smallest
end

# Reverses the values in the integer array in place
# Time complexity: O(n)
# Space complexity: O(1)
def reverse(array, length)
  iterations = length / 2
  iterations.times do |index|
    temporary = array[index]
    array[index] = array[length - 1 - index]
    array[length - 1 - index] = temporary
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(logn)
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  bigger = array.length - 1
  smaller = 0
  while bigger >= smaller
    middle = (high + low) / 2
    if array[middle] == value_to_find
      return true
    elsif array[middle] > value_to_find
      bigger = middle - 1
    else
      smaller = middle + 1
    end
  end
  return false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index + 1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end

## --- END OF METHODS ---
