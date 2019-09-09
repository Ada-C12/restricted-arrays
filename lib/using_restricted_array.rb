require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil


# Time complexity: n
# Space complexity: 1
# time increases linearly by amount of elements as 2 times more elements, will take two times more to get the length.
# space complexity is one (result is stored in a variable).  
def length(array)
  index = 0
  count =  0

  until array[index] == nil
      array[index]
      index += 1  
      count += 1
  end
  return count 
end

# Prints each integer values in the array
# Time complexity: ?
# Space complexity: ?
def print_array(array)
  index = 0

  while array[index] != nil
      p array[index] + " "
      index += 1 
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?

def search(array, length, value_to_find)
  index = 0
  find_value = false

  while array[index] != nil
    if array[index] == value_to_find
      find_value = true
     break
    else
      index += 1
    end
  end
  return find_value
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_largest(array, length)
  index = 0
  max = array[0]

  while array[index] != nil
    if array[index] >= max 
      max = array[index]
    end
    index += 1
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_smallest(array, length)
  index = 0
  min = array[0]

  while array[index] != nil
    if array[index] < min 
      min = array[index]
    end
    index += 1
  end
  return min
end

# Reverses the values in the integer array in place
# Time complexity: ?
# Space complexity: ?
def reverse(array, length)
  memo = 0
  i = 0
  j = length - 1

  while i < j 
    memo = array[i]
    array[i] = array[j]
    array[j] = memo
    i += 1
    j -= 1
  end

end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def binary_search(array, length, value_to_find)
  start = 0
  middle = (start + length - 1) / 2
  
  while array[middle] != value_to_find
    if array[middle] < value_to_find
      start = middle + 1
    else array[middle] > value_to_find
      middle = (start + middle - 1)/2
    end
  end
  return array[middle] == value_to_find
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
