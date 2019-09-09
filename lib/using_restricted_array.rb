require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(1), the block will always run at most 20 times.
# Space complexity: O(1), variables are created only once.
def length(array)
  array_length = 0
  20.times do |i|
    if array[i] != nil
      array_length += 1
    elsif array[i] == nil
      break
    end
  end
  return array_length
  # raise NotImplementedError
end

# Prints each integer values in the array
# Time complexity: O(n), the code will run 'n' times with 'n' being the length of the array.
# Space complexity: O(1), a 'print' method will not use additional memory.
def print_array(array)
  (length(array)).times do |i|
    print array[i]
  end
  # raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n), the time used is dependent on the value of 'length'.
# Space complexity: O(1), the variables are constant and the space used does not change as the time complexity increases.
def search(array, length, value_to_find)
  length.times do |i|
    if array[i] == value_to_find
      return true
    end
  end
  return false # if "do" loop never returns true, value doesn't exist
  # raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n), the time used is again dependent on the value of 'length'.
# Space complexity: O(1), the variable 'largest_int' is assigned to a value that already exists in 'array', so it does not take up more memory.
def find_largest(array, length)
  largest_int = array[0]
  (length - 1).times do |i|
    if array[i + 1] > largest_int
      largest_int = array[i + 1]
    end
  end
  return largest_int
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n), as usual, the time used is dependent on the value of 'length'.
# Space complexity: O(1), the variable 'smallest_int' is assigned to a value that already exists in 'array', so it does not take up more memory.

# NOTE: the code below is also the code I originally had for 'find_largest'. However, in 'find_largest', I altered the numeric value of 'length' and the array index by 1. I wanted to account for the fact that 'largest_int' is already assigned to array[0], so it would be redundant to include array[0] in the 'times' loop to compare itself to itself (i.e. 'i=0, array[i] > largest_int'). I'm not sure which method ends up being the least costly, or if the difference is so insignificant that it doesn't matter. 

def find_smallest(array, length)
  smallest_int = array[0]
  length.times do |i|
    if array[i] < smallest_int
      smallest_int = array[i]
    end
  end
  return smallest_int
end

# Reverses the values in the integer array in place
# Time complexity: O(n), even though the variable 'length' upon which the time complexity depends is divided in half, it will still run 'n' number of times.
# Space complexity: O(n), because the variable 'int_holder' is created with every loop, and the variables 'a' and 'b' are modified with each loop.
def reverse(array, length)
  a = 0
  b = length - 1  # assigned to last index of array
  (length / 2).times do
    int_holder = array[a]
    array[a] = array[b]
    array[b] = int_holder
    a += 1
    b -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n), the code will run 'length' number of times in a worst case scenario.
# Space complexity: O(1), the variable 'found' will be assigned a value at most twice (once when it is declared, and once when the first 'value_to_find' element is found.)
def binary_search(array, length, value_to_find)
  found = false
  length.times do |i|
    if array[i] == value_to_find
      found = true
      break
    end
  end
  return found
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
    temp_index = index+1 # compare with values at index+1 to length-1
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
