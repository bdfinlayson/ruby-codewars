#Create a method minmax that accepts a list and a block. The block itself should compare two elements, so the method can sort the elements and return the minimum and maximum as a 2-element array.
#
#Here's a simple example:
#
#minmax([3,2,5,4]){|a,b| a <=> b}  #=> [2,5] 
#minmax([2,14,7,9]){|a,b| a.to_s <=> b.to_s}  #=> [14,9]
#If you need help, here's a reference:
#
#http://www.rubycuts.com/enum-minmax
#

#My solution:

def minmax list, &block
  # your solution here
  list.minmax(&block)
end

describe "minmax" do
  list = [13,2,5,4]
  list2 = [19,44,33,22,11,55,333,555]
  list3 = [4, 4, 4, 4, 4, 4, 4, 4, 4]
  Test.assert_equals(minmax(list){|a,b| a <=> b}, [2,13], "should return the min and max values after numeric sorting")
  Test.assert_equals(minmax(list2){ |a,b| a <=> b}, [11,555], "should return min and max vals")
  Test.assert_equals(minmax(list3) { |a,b| a <=> b }, [4,4] , "comparison of many equal values returns only two equal values")
  Test.assert_equals(minmax(list){|a,b| a.to_s <=> b.to_s}, [13,5], "should return the min and max values after string sorting")
  Test.assert_equals(minmax([]){|a,b| a <=> b}, [nil, nil], "empty list should return nils")
end
