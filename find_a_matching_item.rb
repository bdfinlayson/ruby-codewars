#Enumerable Magic #7 - Find a Matching Item
#
#Create a method find that accepts a list and a block, and returns the first item for which the block returns true. If no item in the list matches, return nil.
#
#  If you need help, here's a reference:
#
#  http://www.rubycuts.com/enum-detect


#My solution
def find list, &block
  list.detect(&block) # detect passes each entry in enum to block and returns the first for which block is not false. If there are no matches, it calls ifnone (eg: detect(ifnone = nil) { |obj| block }, and returns the value of ifnone. Else it returns nil.
end


#My Tests
describe "find" do
  list = [0,1,2,3,5,8,13]
  Test.assert_equals(find(list){|item| item.odd?}, 1, "1 is the first item in the list that is odd")
end
