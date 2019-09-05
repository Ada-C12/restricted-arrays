require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: n based on length
# Space complexity: 1, needs space for 1 variable 
def length(array)
  index = 0
  while array[index] 
    index += 1
  end
  return index
end

# Prints each integer values in the array
# Time complexity: n based on length
# Space complexity: 1, needs space for 1 variable 
def print_array(array)
  i = 0
  while array[i]
    puts array[i]
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: n based on length
# Space complexity: 1, bc using same amount of extra memory (which happens to be none) no matter input size
def search(array, length, value_to_find)
  length.times do |index|
    return true if array[index] == value_to_find
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: n based on length
# Space complexity: 1, needs space for 1 variable 
def find_largest(array, length)
  curr_largest = array[0]
  
  length.times do |index|
    if array[index] > curr_largest
      curr_largest = array[index]
    end
  end
  return curr_largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: n based on length
# Space complexity: 1, needs space for 1 variable 
def find_smallest(array, length)
  curr_smallest = array[0]
  
  length.times do |index|
    if array[index] < curr_smallest
      curr_smallest = array[index]
    end
  end
  return curr_smallest
end

# Reverses the values in the integer array in place
# Time complexity: n, simplified from n/2
# Space complexity: 1, needs space for 3 variables
def reverse(array, length)
  temp = nil
  left_bookend = 0
  right_bookend = length-1
  
  until left_bookend >= right_bookend
    temp = array[left_bookend]
    array[left_bookend] = array[right_bookend]
    array[right_bookend] = temp
    
    left_bookend += 1
    right_bookend -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: log n, b/c cutting problem by half with every iteration
# Space complexity: 1, needs space for 3 variables 
def binary_search(array, length, value_to_find)
  return false if length == 0
    
  left_bookend = 0
  right_bookend = length-1
  
  until left_bookend >= right_bookend
    mid = (left_bookend + right_bookend) / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      #search left half
      right_bookend = mid - 1
    else
      #search right half
      left_bookend = mid + 1
    end
  end
  
  if (array[left_bookend] == value_to_find) || (array[right_bookend] == value_to_find)
    return true
  else
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

