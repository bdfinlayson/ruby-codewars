# Enumerable Magic #26 - Grab Elements While...

# Create a method take_while that accepts a list and a block, and returns a array of the first several elements from the list, for as long as the block returns true.

# Keep in mind, we don't want all the items for which the block returns true; once we get a false response, we want to stop looking. So this example:

# take_while([0,1,2,3,4,5,6]){|item| item.even?}


# Will only return [0], not [0,2,4,6].

# If you need help, here's a reference:

# http://www.rubycuts.com/enum-take-while


def take_while list, &block
  # accept a list and block
  # iterate through each item
  # add each item to an array that meet the block conditions
  # exit out of the method on the first false response
  arr = Array.new

  list.each do |x|
    if block.call(x) == false
      return arr
    else
      arr << x
    end
  end
  arr
end


describe "take_while" do
  list = [0,1,2,3,5,8,13]
  Test.assert_equals(take_while(list){|item| item.even?}, [0], "should stop returning even numbers when an odd number is found")
end

describe 'take_while' do
  list = ["bryan","david","finlayson"]
  Test.assert_equals(take_while(list){|item| item.length < 6 }, ['bryan','david'], 'should not return your last name')
end


##########
# Alternative solution
##########

def take_while list, &block
  list.take_while(&block)
end

