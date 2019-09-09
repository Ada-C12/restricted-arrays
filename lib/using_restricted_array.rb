require_relative 'restricted_array.rb'

# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil

# Time complexity: O(n) because the method loops through the array until it reaches nil, the time that the algorithm takes is linear in relation to the length of the array
# Space complexity: O(1) because the values stored (i and fin) do not increase in size with different array lengths
def length(array)
  i = 0
  fin = false
  while fin == false
    if array[i] == nil
      fin = true
    else
      i += 1
    end
  end
  
  return i
end

# Prints each integer values in the array
# Time complexity: O(n) because the amount of time the method takes to complete is  linear in relation to the length of the array
# Space complexity: O(1) because the values stored (i and my_length) do not increase in size with different array lengths
def print_array(array)
  i = 0
  my_length = array.length
  
  while i < my_length
    p array[i]
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) because the amount of time the method takes to complete in the worst case is linear in relation to the length of the array
# Space complexity: O(1) because the values stored (i) do not increase in size with different array lengths
def search(array, length, value_to_find)
  i = 0
  
  while i < length
    return true if array[i] == value_to_find
    i += 1
  end
  
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) because the amount of time the method takes to complete in the worst case is  linear in relation to the length of the array
# Space complexity: O(1) because the values stored (i and largest_int) do not increase in size with different array lengths
def find_largest(array, length)
  i = 0
  largest_int = array[0]
  
  while i < length
    largest_int = array[i] if array[i] > largest_int
    i += 1
  end
  
  return largest_int
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) because the amount of time the method takes to complete in the worst case is linear in relation to the length of the array
# Space complexity: O(1) because the values stored (i and smallest_int) do not increase in size with different array lengths
def find_smallest(array, length)
  i = 0
  smallest_int = array[0]
  
  while i < length
    smallest_int = array[i] if array[i] < smallest_int
    i += 1
  end
  
  return smallest_int
end

# Reverses the values in the integer array in place
# Time complexity: O(n) because the amount of time the method takes to complete in the worst case is linear in relation to length of the array
# Space complexity: O(1) because the values stored (j, i, a, and b) do not increase in size with different array lengths
def reverse(array, length)
  i = 0
  j = length - 1
  while i < ( length / 2 )
    a = array[i]
    b = array[j]
    
    array[i] = b
    array[j] = a
    
    i += 1
    j -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) because the amount of time the method takes to complete in the worst case is logarithmic in relation to length of the array
# Space complexity: O(1) because the values stored (j, i, mid) do not increase in size with different array lengths
def binary_search(array, length, value_to_find)
  i = 0
  mid = length / 2
  j = length - 1
  
  while i < j
    return true if array[mid] == value_to_find || array[i] == value_to_find || array[j] == value_to_find
    
    value_to_find < mid ? j = mid - 1 : i = mid + 1
    
    mid = (i + j) / 2
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
