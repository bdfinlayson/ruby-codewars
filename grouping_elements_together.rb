#Enumerable Magic #29 - Grouping Elements Together
#
#Create a method group_by that accepts a list and a block. It should return a hash where the keys are the block return values, and the hash values are arrays of the corresponding items grouped together.
#
#Here's a simple example:
#
#animals = ["cat", "dog", "duck", "cow", "donkey"]
#group_by(animals){|animal| animal[0]}
#    #=> {"c" => ["cat", "cow"], "d" => ["dog", "duck", "donkey"]}
#If you need help, here's a reference:
#
#http://www.rubycuts.com/enum-group-by

#my solution:

def group_by list, &block
  # your solution here
end

#test cases
describe "group_by" do
  animals = ["cat", "dog", "duck", "cow", "donkey"]
  Test.assert_equals(group_by(animals){|animal| animal[0]}, {"c" => ["cat", "cow"], "d" => ["dog", "duck", "donkey"]}, "should group by first letter")
end
