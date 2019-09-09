require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n), linear,  because the amount of times the while loop iterates is directly proportionate to the length of the array.
# Space complexity: O(1), constant, because the only memory being altered is that one length integer, independent of the size of the data set on which it operates.
def length(array)
  length = 0
  
  while array[length] != nil
    length+=1
  end
  
  return length
end

# Prints each integer values in the array
# Time complexity: O(n), linear, because the amount of times the while loop iterates is directly proportionate to the length of the array.
# Space complexity: O(1), constant, because there is just one variable (the counter; i).
def print_array(array)
  array_length = length(array)
  i = 1
  
  array_length.times do
    puts array[i]
    i+=1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n), linear, because the amount of times the while loop iterates is directly proportionate to the length of the array.
# Space complexity: O(1), constant, because there is no additional memory being taken, it just returns true/false.
def search(array, length, value_to_find)
  i = 0
  
  while i < length
    if array[i] == value_to_find
      return true
    else 
      i+=1
    end
  end
  
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n), linear, because the amount of times the while loop iterates is directly proportionate to the length of the array.
# Space complexity: O(1), constant, because the only memory being modified is the "max_value" and "i", no matter the size of the array.
def find_largest(array, length)
  if length == 0
    return nil
  end
  
  max_value = array[0]
  i = 1
  
  while i < length
    if array[i] > max_value
      max_value = array[i]
    else
      i+=1
    end
  end
  
  return max_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n), linear, because the amount of times the while loop iterates is directly proportionate to the length of the array.
# Space complexity: O(1), constant, because the only memory being modified is the "min_value" and "i", no matter the size of the array.
def find_smallest(array, length)
  if length == 0
    return nil
  end
  
  min_value = array[0]
  i = 1
  
  while i < length
    if array[i] < min_value
      min_value = array[i]
    else
      i+=1
    end
  end
  
  return min_value
end

# Reverses the values in the integer array in place
# Time complexity: O(n), linear, because the amount of times the while loop iterates is directly proportionate to the length of the array.
# Space complexity: O(1), constant, because the amount of variables being stored does not change regardless of the size of the array or data being passed through.
def reverse(array, length)
  i = 0
  j = length - 1
  
  while i < j
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    
    i+=1
    j-=1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n), logarithmic, because increasing the size of the data set has a relatively small effect on the amount of times the loop has to iterate.
# Space complexity: O(1), constant, because the amount of variables being stored does not change regardless of the size of the array or data being passed through.
def binary_search(array, length, value_to_find)
  if length == 0
    return false
  end
  
  low = 0
  high = length - 1
  
  while low <= high
    mid = (low+high)/2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    elsif array[mid] < value_to_find
      low = mid + 1
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
