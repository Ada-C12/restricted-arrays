require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) - n is the number of elements in array
# Space complexity: O(1)
def length(array)
  length = 0
  index = 0

  value = array[index]
  until value == nil
    length += 1
    index += 1
    value = array[index]
  end
  
  return length
end

# Prints each integer values in the array
# Time complexity: O(n) - n is number of elements in array
# Space complexity: O(1)
def print_array(array)
  index = 0
  value = array[index]
  until value == nil
    print "#{value} "
    index += 1
    value = array[index]
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) - n is number of elements in array
# Space complexity: O(1)
def search(array, length, value_to_find)
  index = 0
  value = array[index]
  until value == nil
    return true if value == value_to_find
    index += 1
    value = array[index]
  end
  return false 
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) - n is number of elements in array
# Space complexity: O(1)
def find_largest(array, length)
  index = 0
  value = array[index]
  max = value
  length.times do
    max = value if value > max
    index += 1
    value = array[index]
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) - n is number of elements in array
# Space complexity: O(1)
def find_smallest(array, length)
  index = 0
  value = array[index]
  min = value

  length.times do
    min = value if value < min
    index += 1
    value = array[index]
  end
  return min
end

# Reverses the values in the integer array in place
# Time complexity: O(n) - n is number of elements in array / 2
# Space complexity: O(n)
def reverse(array, length)
  low = 0
  high = length - 1

  until low >= high
    top = array[high]
    bottom = array[low]
    array[high] = bottom
    array[low] = top
    high -= 1
    low += 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(logn) - n number of elements in array
# Space complexity: O(1)
def binary_search(array, length, value_to_find)
  high = array[length-1]
  low = array[0]
  mid = (high + low)/2

  until low > high
    if mid == value_to_find
      return true
    elsif mid > value_to_find
      high = mid - 1
      mid = (high + low)/2
    elsif mid < value_to_find
      low = mid + 1
      mid = (high + low)/2
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
