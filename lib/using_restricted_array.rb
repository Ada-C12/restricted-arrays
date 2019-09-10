require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n)
# Space complexity: O(1) - mutating data at each index rather than pushing
def length(array)
  i = 0
  while array[i] != nil
    i += 1
  end
  return i
end

# Prints each integer values in the array
# Time complexity: O(n)
# Space complexity: # print could mess up complexity of space complexity so probably O(1) 
def print_array(array)
  i = 0
  while array[i] != nil
    i += 1
    p array[i]
  end
  return i
  
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n)
# Space complexity: O(1)
def search(array, length, value_to_find)
  i = 0
  while array[i] != value_to_find && array[i] != nil
    i += 1
  end
  return array[i] == value_to_find # equivalent if value_to_find == array[i] return true
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def find_largest(array, length)
  i = 0
  largest_value = array[0]
  while array[i] != nil
    if array[i] > largest_value
      largest_value = array[i]
    end
    i += 1
  end
  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def find_smallest(array, length)
  i = 0
  smallest_value = array[0]
  while array[i] != nil
    if array[i] < smallest_value
      smallest_value = array[i]
    end
    i += 1
  end
  return smallest_value
end

# Reverses the values in the integer array in place
# Time complexity: O(n)
# Space complexity: O(1)
def reverse(array, length)
  count = length.to_i / 2
  last_index = (length - 1)
  count.times do |i|
    temp = array[i]
    array[i] = array[last_index - i]
    array[last_index - i] = temp
  end

end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n)
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  if value_to_find < array[0] || value_to_find > array[length - 1]
    return false
  end

  low_index = 0
  high_index = length - 1
  middle_index = length / 2

  while high_index - low_index > 1 && value_to_find != array[high_index] && value_to_find != array[low_index]
    is_low = value_to_find >= array[low_index] && value_to_find <= array[middle_index]

    if is_low 
      high_index = middle_index
      middle_index = (middle_index + 1) / 2
    else
      low_index = middle_index
      middle_index = ((high_index - low_index) / 2) + low_index
    end
  end
  return value_to_find == array[high_index] || value_to_find == array[low_index]
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
