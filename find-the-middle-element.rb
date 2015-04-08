#As a part of this Kata, you need to create a function that when provided with a triplet, returns the index of the numerical element that lies between the other two elements.

#The input to the function will be an array of three numbers (Haskell: a tuple).

#For example:

#gimme([2, 3, 1]) => 0
#2 is the number that fits between 1 and 3 and the index of 2 in the input array is 0.

#Another example (just to make sure it is clear):
#
#gimme([5, 10, 14]) => 1
#10 is the number that fits between 5 and 14 and the index of 10 in the input array is 1.


#My Solution

def gimme(input_array)
  #saves the input array to a new variable
  arr = input_array
  #sorts the array and saves the output to a variable
  sortedArr = arr.sort
  #finds and saves the index of the middle number
  index = input_array.index(sortedArr[1])
  #return the index of the middle number in the input_array
  return index
end

#My Test Cases

Test.assert_equals(gimme([2, 3, 1]), 0, 'Finds the index of middle element')
Test.assert_equals(gimme([5, 10, 14]), 1, 'Finds the index of middle element')
Test.assert_equals(gimme([10000,40,667]), 2, 'Finds the index of the middle element')
Test.assert_equals(gimme([33.2, 336.9, 33321.6]), 1, 'Finds the middle float')
Test.assert_equals(gimme(['a','x','m']), 2, 'Even finds the middle character')
