require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: linear, although it appears constant because the loop is counter-controlled and does not depend on the size of the array, this is a cheat as the number is based on the maximum size of the array. Thereore, as the array grows, the counter should grow to accomodate it. 
# Space complexity: constant, there are 2 variables created but they are over-written and do not depend on the size of the array
def length(array)
  i = 0
  length = 0
  21.times do
    until array[i] == nil
      i += 1
      length += 1
    end
  end
  return length
end

# Prints each integer values in the array
# Time complexity: linear, please see explanation on LN 9. 
# Space complexity: constant, no variables are stored in memory.
def print_array(array)
  21.times do
    until array[i] == nil
      i += 1
      puts array[i]
    end
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: linear, the array is passed through once, as the array grows, the time required to look through each value increases at the same rate.
# Space complexity: contant, the one stored value is over-written and does not depend on the size of the array
def search(array, length, value_to_find)
  result = false
  i = 0
  length.times do
    i += 1
    if array[i] == value_to_find
      result = true
    end
  end
  return result
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: linear, the array is passed through once, as the array grows, the time required to look through each value increases at the same rate.
# Space complexity: constant, there are 2 variables created but they are over-written and do not depend on the size of the array
def find_largest(array, length)
  high_value = array[0]
  i = 0
  (length).times do 
    if array[i] >= high_value
      high_value = array[i]
    end
    i += 1
  end
  return high_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: linear, the array is passed through once, as the array grows, the time required to look through each value increases at the same rate.
# Space complexity: constant, there are 2 variables created but they are over-written and do not depend on the size of the array
def find_smallest(array, length)
  low_value = array[0]
  i = 0
  (length).times do 
    if array[i] <= low_value
      low_value = array[i]
    end
    i += 1
  end
  return low_value
end

# Reverses the values in the integer array in place
# Time complexity: quadratic, the array is iterated through twice, so as it gorws, the time required to process it would grow twice as much.
# Space complexity: linear, the array is copied over into transformed_array, which is the same size as the original array, so as array grows, the space required would grow at the same rate.
def reverse(array, length)
  transformed_array = []
  i = 1
  (length + 1).times do
    transformed_array.push(array[length - i])
    i += 1
  end
  
  transformed_array.push(nil)
  i = 0
  (length).times do
    array[i] = transformed_array[i]
    i += 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: logarithmic, as the size of the array grows, the number of times min or max have to be recalculated will increase at a higher rate, however, not high enough to be quadratic.
# Space complexity: constant, the four variables are assigned and may be over-written as the grogram runs regardless of the size of the array.

def binary_search(array, length, value_to_find)
  
  result = false
  
  min = 0
  max = length - 1
  midpoint = nil
  
  until midpoint == min || midpoint == max || result == true
    midpoint = ( min + max ) / 2 
    if array[midpoint] == value_to_find || array[min] == value_to_find || array[max] == value_to_find
      return true
    elsif array[midpoint] < value_to_find
      min = midpoint
    else array[midpoint] > value_to_find
      max = midpoint
    end
  end
  return result
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
