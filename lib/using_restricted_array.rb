require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n), where n is the array size
# Space complexity: O(1)
def length(array)
  index = 0
  until array[index] == nil
    index += 1
  end
  return index
end

# Prints each integer values in the array
# Time complexity: O(n), where n is the array size
# Space complexity: O(1)
def print_array(array)
  index = 0
  until array[index] == nil
    print array[index]
    index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(1)
# Space complexity: O(1)
def search(array, length, value_to_find)
  length.times do |value|
    return true if (array[value] == value_to_find)
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n), where n is the length value
# Space complexity: O(1)
def find_largest(array, length)
  max = 0
  length.times do |value|
    item = array[value]
    if item > max
      max = item
    end
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n), where n is the length value
# Space complexity: O(1)
def find_smallest(array, length)
  min = array[0]
  length.times do |value|
    item = array[value]
    if item < min
      min = item
    end
  end
  return min
end

# Reverses the values in the integer array in place
# Time complexity: O(n), where n is the array size
# Space complexity: O(1)
def reverse(array, length)
  return if length <= 1 # needs at least two to reverse
  
  # start first half at beginning of array
  first_half = 0
  # start last half at the end of the array
  last_half = (length - 1)
  
  while first_half < last_half
    # hold first half value
    hold = array[first_half]
    
    # switch out first half value
    array[first_half] = array[last_half]
    
    # swap last half value with held value
    array[last_half] = hold
    
    # move halves inward
    first_half += 1
    last_half -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n)
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  return false if length == 0
  
  low_half = 0
  high_half = length - 1
  
  while low_half <= high_half
    middle = (low_half + high_half) / 2
    
    if array[middle] == value_to_find
      return true
    elsif array[middle] > value_to_find
      # switch highest to one up from the middle
      high_half = middle - 1
    else
      # swtich lowest value to one down from the middle
      low_half = middle + 1
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
