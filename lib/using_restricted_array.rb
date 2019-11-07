require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: linear
# Space complexity: constant
def length(array)
  if array[0] == nil
    return 0
  else
    length = 0
    index = 0
    until array[index] == nil
      length += 1
      index += 1
    end
  end
  return length
end

# Prints each integer value in the array
# Time complexity: linear
# Space complexity: constant
def print_array(array)
  if array[0] == nil
    return 0
  else
    index = 0
    until array[index] == nil
      p "#{array[index]}"
      index += 1
    end
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: linear
# Space complexity: constant
def search(array, length, value_to_find)
  index = 0 
  while index < length
    if array[index] == value_to_find
      return true
    else
      index += 1
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: linear
# Space complexity: constant
def find_largest(array, length)
  largest = 0
  i = 1 
  while array[i] != nil
    if array[i] > largest
      largest = array[i]
      i += 1
    else 
      i += 1
    end
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: linear
# Space complexity: constant
def find_smallest(array, length)
  if length == 0
    return nil
  else
    smallest = array[0]
    i = 1 
    while array[i] != nil
      if array[i] < smallest
        smallest = array[i]
        i += 1
      else 
        i += 1
      end
    end
    return smallest
  end
end

# Reverses the values in the integer array in place
# Time complexity: O (log n) -- because worst case scenario, if we double the length of the array, we're only perfoming one more operation
# Space complexity: constant
def reverse(array, length)
  i = 1
  j = length - 1
  while i < j
    reversed = array[i]
    array[i] = array[j]
    array[j] = reversed
    i += 1
    j -= 1
  end
  return reversed
end


# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O of log n with n as the length of the array because we're halving n with each step
# Space complexity: constant because we are reassigning values to the same three variables
def binary_search(array, length, value_to_find)
  low = 0
  j = length - 1
  high = j
  while low <= high
    mid = low + ((high - low) / 2)
    if value_to_find == array[mid]
      return true
    elsif value_to_find == array[high]
      return true
    elsif value_to_find == array[low]
      return true
    elsif value_to_find > array[mid]
      high = mid - 1
    else
      low = mid + 1
    end
    return false
  end
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
