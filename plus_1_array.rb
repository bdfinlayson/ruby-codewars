# +1 Array

# Given an array of integers of any length, return an array that has 1 added to the value represented by the array.

# For example an array [2, 3, 9] equals 239, add one would return an array [2, 4, 0].

# [4, 3, 2, 5] would return [4, 3, 2, 6]

# Only positive, single digit integers are allowed in the array so the function should return null if any of the array values are negative or more than 10

# [1, -9] would return null/nil/None (according to the language implemented).

def up_array(arr)
  #join the array
  #convert to int
  #add 1
  #convert back to string
  #split the string
  #return the new array

  if check_for_negatives_and_words(arr) || check_for_size(arr) || check_for_nil(arr)
    nil
  else
    interpret_array(arr)
  end
end

def interpret_array(arr)
  nums_arr = (arr.join.to_i.next).to_s.split('')
  new_arr = Array.new
  nums_arr.each { |x| new_arr << x.to_i }
  new_arr
end

def check_for_negatives_and_words(arr)
  /-|[a-zA-Z]/.match(arr.join)
end

def check_for_size(arr)
  true if arr.sort.last >= 10 unless arr.sort.last.nil?
end

def check_for_nil(arr)
  arr.include? nil
end

Test.assert_equals(up_array([2,3,9]), [2,4,0])
Test.assert_equals(up_array([4,3,2,5]), [4,3,2,6])
Test.assert_equals(up_array([1,-9]), nil)
Test.assert_equals(up_array([1,'a']), nil)


##########
# Alternative Solution
##########

def up_array(arr)
  return nil if arr.empty?
  arr.each{ |e| return nil if e < 0 || e > 9 }
  (arr.join.to_i + 1).to_s.split('').map(&:to_i)
end
